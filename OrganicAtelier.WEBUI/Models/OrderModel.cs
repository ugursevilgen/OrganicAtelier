using OrganicAtelier.Entity;
using System.ComponentModel;

namespace OrganicAtelier.WEBUI.Models
{
    public class OrderModel
    {
        [DisplayName("Ad")]
        public string FirstName { get; set; }
        [DisplayName("Soyad")]
        public string LastName { get; set; }
        [DisplayName("Adres")]
        public string Address { get; set; }
        [DisplayName("Şehir")]
        public string City { get; set; }
        [DisplayName("Telefon")]
        public string Phone { get; set; }        
        public string Email { get; set; }

        [DisplayName("Kart Sahibi")]
        public string CardName { get; set; }
        [DisplayName("Kart Numarası")]
        public string CardNumber { get; set; }
        [DisplayName("Son Kullanım Ayı")]
        public string ExpirationMonth { get; set; }
        [DisplayName("Son Kullanım Yılı")]
        public string ExpirationYear { get; set; }
        [DisplayName("Güvenlik Kodu")]
        public string Cvv { get; set; }

        public CartModel CartModel { get; set; }
    }
}
