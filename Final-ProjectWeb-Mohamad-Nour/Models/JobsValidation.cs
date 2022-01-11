using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Final_ProjectWeb_Mohamad_Nour.Models
{
    [MetadataType(typeof(jobMetaData))]
    public partial class job
    {

        public class jobMetaData
        {

            public int id { get; set; }
            [DisplayName("Position")]
            [Required]
            public string position { get; set; }
            [DisplayName("Salary")]
            public int salary { get; set; }

        }
    } }