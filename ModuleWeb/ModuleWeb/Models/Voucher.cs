//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ModuleWeb.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Voucher
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public Nullable<System.DateTime> ActiveAt { get; set; }
        public Nullable<System.DateTime> ExpiresAt { get; set; }
        public string ApplicableItems { get; set; }
        public string Unit { get; set; }
        public double Amount { get; set; }
        public Nullable<int> Quota { get; set; }
        public string Code { get; set; }
        public Nullable<double> MaxMonetary { get; set; }
    }
}