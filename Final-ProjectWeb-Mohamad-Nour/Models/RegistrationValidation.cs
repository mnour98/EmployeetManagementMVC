using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Final_ProjectWeb_Mohamad_Nour.Models
{
    [MetadataType(typeof(registrationMetaData))]
    public partial class registration
    {
        public object ImageFile { get; internal set; }

        public class registrationMetaData
        {

            public int id { get; set; }
            [DisplayName("First Name")]
            [Required]
            public string firstname { get; set; }
            [DisplayName("Last Name")]
            [Required]

            public string lastname { get; set; }
            [DisplayName("Identification Number")]
            [Required]
          
             [RegularExpression(@"^\d{10}$", ErrorMessage = "Sorry,ID should be 10 digits.")]
            public string identification_number { get; set; }
            [DisplayName("Job position")]
            public Nullable<int> job_id { get; set; }
            public Nullable<int> group_id { get; set; }
            [Display(Name = "Phone Number")]
            [DataType(DataType.PhoneNumber)]
            [Required]

            public Nullable<int> mobile_number { get; set; }

            [DisplayName("Email")]
            [DataType(DataType.EmailAddress)]
            [Required(ErrorMessage = "Email is required.")]
            [RegularExpression(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*", ErrorMessage = "Email is not valid.")]

            public string email_ad { get; set; }




            public virtual group group { get; set; }
            public virtual job job { get; set; }
        }
    }
}