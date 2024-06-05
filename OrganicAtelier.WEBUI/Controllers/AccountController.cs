using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using OrganicAtelier.WEBUI.EmailServices;
using OrganicAtelier.WEBUI.Identity;
using OrganicAtelier.WEBUI.Models;

namespace OrganicAtelier.WEBUI.Controllers
{
    public class AccountController : Controller
    {
        private UserManager<ApplicationUser> _userManager;
        private SignInManager<ApplicationUser> _signInManager;

        public AccountController(UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager)
        {
            _userManager = userManager;
            _signInManager = signInManager;
        }
              

        public IActionResult Login(string ReturnUrl=null)
        {
            return View(new LoginModel()
            {
                ReturnUrl=ReturnUrl
            });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Login(LoginModel model)
        {
            ModelState.Remove("ReturnUrl");
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            var user = await _userManager.FindByEmailAsync(model.Email);

            if (user == null) 
            {
                ModelState.AddModelError("", "Bu email ile hesap oluşturulmamıştır.");
                return View(model);
            }

            if(!await _userManager.IsEmailConfirmedAsync(user))
            {
                ModelState.AddModelError("", "Lütfen hesabınızı email ile onaylayınız");
                return View(model);
            }


            var result = await _signInManager.PasswordSignInAsync(user, model.Password, true, false);

            if (result.Succeeded)
            {
                return Redirect(model.ReturnUrl?? "~/");
            }

            ModelState.AddModelError("", "Giriş bilgilerinizi kontrol ediniz");

            return View(model);
        }

        public async Task<IActionResult> Logout()
        {
            await _signInManager.SignOutAsync();
            return Redirect("~/");
        }

        public IActionResult Register()
        {
            return View(new RegisterModel());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Register(RegisterModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            var user = new ApplicationUser()
            {
                UserName = model.Username,
                Email = model.Email,
                FullName = model.FullName
            };

            var result = await _userManager.CreateAsync(user, model.Password);

            if (result.Succeeded)
            {
                //generate Token
                var code = await _userManager.GenerateEmailConfirmationTokenAsync(user);
                var callbackUrl = Url.Action("ConfirmEmail", "Account", new
                {
                    userId = user.Id,
                    token = code
                });
                //send Email
                string activeUrl = "http://localhost:5050" + callbackUrl;
                string body = $"Hesabınızı onaylamak için lütfen <a href='{activeUrl}' target='_blank'> linke </a> tıklayınız.";
                MailHelper.SendMail(body, user.Email, "Hesap Onayı");

                TempData["success"] = "Kayıt Başarılı. Lütfen Mail adresinize giderek onaylayınız.";
                return RedirectToAction("Login", "Account");
            }

            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error.Description);
            }

            return View(model);
        }

        public async Task<IActionResult> ConfirmEmail(string userId, string token)
        {
            if(userId==null || token == null)
            {
                TempData["message"] = "Geçersiz Token";
                return View();
            }

            var user = await _userManager.FindByIdAsync(userId);
            if (user != null)
            {
                var result = await _userManager.ConfirmEmailAsync(user, token);
                if (result.Succeeded)
                {
                    TempData["message"] = "Hesabınız Onaylandı";
                    return View();
                }
            }

            TempData["message"] = "Hesabınız onaylanamadı";
            return View();
        }

        public IActionResult ForgotPassword()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> ForgotPassword(string Email)
        {
            if (string.IsNullOrEmpty(Email))
            {
                return View();
            }

            var user = await _userManager.FindByEmailAsync(Email);

            if (user==null)
            {
                return View();
            }

            //generate Token
            var code = await _userManager.GeneratePasswordResetTokenAsync(user);
            var callbackUrl = Url.Action("ResetPassword", "Account", new
            {                
                token = code,
                email=Email
            });
            //send Email
            string activeUrl = "http://localhost:5050" + callbackUrl;
            string body = $"Yeni şifre tanımlamak için lütfen <a href='{activeUrl}' target='_blank'> linke </a> tıklayınız.";
            MailHelper.SendMail(body, Email, "Şifre Resetleme");

            TempData["success"] = "Lütfen yeni şifrenizi tanımlamak için mail adresinize gönderilen linke tıklayınız.";
            return RedirectToAction("Login", "Account");
        }

        public IActionResult ResetPassword(string token, string email)
        {
            if(token==null || email == null)
            {
                return RedirectToAction("Login");
            }

            return View(new ResetPasswordModel()
            {
                Email=email,
                Token=token
            });
        }

        [HttpPost]
        public async Task<IActionResult> ResetPassword(ResetPasswordModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            var user = await _userManager.FindByEmailAsync(model.Email);

            if (user == null)
            {
                return RedirectToAction("ForgotPassword");
            }

            var result = await _userManager.ResetPasswordAsync(user, model.Token, model.Password);

            if (result.Succeeded)
            {
                TempData["success"] = "Şifreniz yenilenmiştir.";
                return RedirectToAction("Login");
            }

            return View(model);
        }

        public IActionResult AccessDenied()
        {
            TempData["message"] = "Yetkiniz olmayan sayfadasınız. Anasayfaya yönlendiriliyorsunuz";
            return View();
        }
    }
}
