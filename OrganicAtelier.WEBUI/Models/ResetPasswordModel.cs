﻿using System.ComponentModel.DataAnnotations;

namespace OrganicAtelier.WEBUI.Models
{
    public class ResetPasswordModel
    {
        [Required]
        public string Token { get; set; }

        [Required]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Compare("Password")]
        public string RePassword { get; set; }
    }
}
