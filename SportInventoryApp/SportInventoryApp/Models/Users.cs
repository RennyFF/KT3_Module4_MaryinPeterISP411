//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SportInventoryApp.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Users
    {
        public int Id { get; set; }
        public int RoleId { get; set; }
        public string SecondName { get; set; }
        public string FirstName { get; set; }
        public string PatronomycName { get; set; }
        public string Email { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
        public string Phone { get; set; }
        public Nullable<int> PasportSerial { get; set; }
        public Nullable<int> PasportNumber { get; set; }
        public System.DateTime Birthday { get; set; }
        public Nullable<System.DateTime> LastEntry { get; set; }
        public Nullable<bool> TypeOfEntry { get; set; }
        public int SexId { get; set; }
    
        public virtual Role Role { get; set; }
        public virtual Sex Sex { get; set; }
    }
}
