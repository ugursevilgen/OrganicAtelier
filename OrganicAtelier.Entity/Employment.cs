using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace OrganicAtelier.Entity
{
    public class Employment
    {
        public int Id { get; set; }
        [StringLength(50)]
        public string Title { get; set; }
        public bool Status { get; set; }

        public int AboutId;
        public About About;
    }
}
