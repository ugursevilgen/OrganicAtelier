using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrganicAtelier.Entity
{
    public class Blog
    {
        public int Id { get; set; }
        [StringLength(200)]
        public string Title { get; set; }
        public string ImageUrl { get; set; }
        [StringLength(2000)]
        public string Text { get; set; }
        [StringLength(200)]
        public string Writer { get; set; }

        [Display(Name = "Tarih")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime Date { get; set; }

    }
}
