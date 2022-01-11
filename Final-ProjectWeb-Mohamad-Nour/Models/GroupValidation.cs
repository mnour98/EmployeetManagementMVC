using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Final_ProjectWeb_Mohamad_Nour.Models
{
    [MetadataType(typeof(groupnMetaData))]
    public partial class group
    {
        public class groupnMetaData
        {
            public int id { get; set; }
            [DisplayName("Group number ")]
            [Required]
            public string group_number { get; set; }
            public string year { get; set; }



        }



    }
}
