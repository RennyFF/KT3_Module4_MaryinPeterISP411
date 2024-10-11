using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace SportInventoryApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для EditPage.xaml
    /// </summary>
    public partial class EditPage : Page
    {
        public bool IsAdding = false;
        public Models.Users CurrentUser = null;
        public EditPage(Models.Users User, bool Flag)
        {
            InitializeComponent();
            IsAdding = Flag;
            if (User != null)
            {
                CurrentUser = User;
            }
            Init();
        }

        public void Init()
        {
            try
            {
                var Roles = Models.SportInventoryDBEntities.GetContext().Role.ToList();
                Roles.Insert(0, new Models.Role() { Name = "Выберите роль" });
                RoleNameCombobox.ItemsSource = Roles;
                RoleNameCombobox.SelectedIndex = 0;
                var Sexes = Models.SportInventoryDBEntities.GetContext().Sex.ToList();
                Sexes.Insert(0, new Models.Sex() { Name = "Выберите пол" });
                SexName.ItemsSource = Sexes;
                SexName.SelectedIndex = 0;
                if (IsAdding == false)
                {
                    SecondName.Text = CurrentUser.SecondName;
                    FirstName.Text = CurrentUser.FirstName;
                    PatronomycName.Text = CurrentUser.PatronomycName;
                    RoleNameCombobox.SelectedIndex = CurrentUser.RoleId;
                    DateBirthday.Text = CurrentUser.Birthday.ToShortDateString().ToString();
                    PhoneNumber.Text = CurrentUser.Phone;
                    SexName.SelectedIndex = CurrentUser.SexId;
                    Email.Text = CurrentUser.Email;
                    Login.Text = CurrentUser.Login;
                    Password.Password = CurrentUser.Password;
                    ConfirmPassword.Password = CurrentUser.Password;
                    Id.Text = CurrentUser.Id.ToString();
                }
                else
                {
                    Id.Text = (Models.SportInventoryDBEntities.GetContext().Users.ToList().Last().Id + 1).ToString();
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Произошла ошибка!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }


        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (Utils.Navigation.ActiveFrame.CanGoBack)
            {
                Utils.Navigation.ActiveFrame.GoBack();
            }
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (IsAdding == false)
                {
                    StringBuilder Errors = new StringBuilder();
                    if (string.IsNullOrEmpty(SecondName.Text))
                    {
                        Errors.AppendLine("Заполните фамилию!");
                    }
                    if (string.IsNullOrEmpty(FirstName.Text))
                    {
                        Errors.AppendLine("Заполните имя!");
                    }
                    if (string.IsNullOrEmpty(PatronomycName.Text))
                    {
                        Errors.AppendLine("Заполните отчество!");
                    }
                    if (RoleNameCombobox.SelectedIndex == 0)
                    {
                        Errors.AppendLine("Выберите роль!");
                    }
                    if (string.IsNullOrEmpty(DateBirthday.Text))
                    {
                        Errors.AppendLine("Выберите день рождения!");
                    }
                    if (string.IsNullOrEmpty(PhoneNumber.Text))
                    {
                        Errors.AppendLine("Заполните номер телефона!");
                    }
                    if (SexName.SelectedIndex == 0)
                    {
                        Errors.AppendLine("Выберите пол!");
                    }
                    if (string.IsNullOrEmpty(Email.Text))
                    {
                        Errors.AppendLine("Заполните почту!");
                    }
                    else
                    {
                        var EmailFromDB = Models.SportInventoryDBEntities.GetContext().Users.Where(d => d.Email == Email.Text).FirstOrDefault();
                        if (EmailFromDB != null && EmailFromDB.Email != CurrentUser.Email)
                        {
                            Errors.AppendLine("Почта уже занята!");
                        }
                    }
                    if (string.IsNullOrEmpty(Login.Text))
                    {
                        Errors.AppendLine("Заполните логин!");
                    }
                    else
                    {
                        var LoginFromDB = Models.SportInventoryDBEntities.GetContext().Users.Where(d => d.Login == Login.Text).FirstOrDefault();
                        if (LoginFromDB != null && LoginFromDB.Login != CurrentUser.Login)
                        {
                            Errors.AppendLine("Логин уже занят!");
                        }
                    }
                    if (string.IsNullOrEmpty(Password.Password))
                    {
                        Errors.AppendLine("Заполните пароль!");
                    }
                    else
                    {
                        if (Password.Password.Length < 8)
                        {
                            Errors.AppendLine("Пароль меньше 8 символов!");
                        }
                        if (Password.Password.ToLower() == Password.Password || Password.Password.ToUpper() == Password.Password)
                        {
                            Errors.AppendLine("Пароль должен быть в разном регистре!");
                        }
                        bool IsNumberThere = false;
                        bool IsSpecialCharThere = false;
                        foreach (var item in Password.Password)
                        {
                            if (char.IsDigit(item))
                            {
                                IsNumberThere = true;
                            }
                            if (char.IsSymbol(item) || char.IsSeparator(item) || char.IsPunctuation(item))
                            {
                                IsSpecialCharThere = true;
                            }
                        }
                        if (IsNumberThere == false)
                        {
                            Errors.AppendLine("Пароль должен содержать в себе цифры!");
                        }
                        if (IsSpecialCharThere == false)
                        {
                            Errors.AppendLine("Пароль должен содержать в себе символы!");
                        }
                    }
                    if (string.IsNullOrEmpty(ConfirmPassword.Password))
                    {
                        Errors.AppendLine("Подтвердите пароль!");
                    }
                    if (Password.Password != ConfirmPassword.Password)
                    {
                        Errors.AppendLine("Пароль с подтверждением не сходятся!");
                    }
                    if (Errors.Length > 0)
                    {
                        MessageBox.Show(Errors.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                    CurrentUser.SecondName = SecondName.Text;
                    CurrentUser.FirstName = FirstName.Text;
                    CurrentUser.PatronomycName = PatronomycName.Text;
                    CurrentUser.Birthday = (DateTime)DateBirthday.SelectedDate;
                    CurrentUser.Email = Email.Text;
                    CurrentUser.Phone = PhoneNumber.Text;
                    CurrentUser.Login = Login.Text;
                    CurrentUser.Password = Password.Password;
                    CurrentUser.SexId = SexName.SelectedIndex;
                    CurrentUser.RoleId = RoleNameCombobox.SelectedIndex;
                    Models.SportInventoryDBEntities.GetContext().SaveChanges();
                }
                else
                {
                    StringBuilder Errors = new StringBuilder();
                    if (string.IsNullOrEmpty(SecondName.Text))
                    {
                        Errors.AppendLine("Заполните фамилию!");
                    }
                    if (string.IsNullOrEmpty(FirstName.Text))
                    {
                        Errors.AppendLine("Заполните имя!");
                    }
                    if (string.IsNullOrEmpty(PatronomycName.Text))
                    {
                        Errors.AppendLine("Заполните отчество!");
                    }
                    if (RoleNameCombobox.SelectedIndex == 0)
                    {
                        Errors.AppendLine("Выберите роль!");
                    }
                    if (string.IsNullOrEmpty(DateBirthday.Text))
                    {
                        Errors.AppendLine("Выберите день рождения!");
                    }
                    if (string.IsNullOrEmpty(PhoneNumber.Text))
                    {
                        Errors.AppendLine("Заполните номер телефона!");
                    }
                    if (SexName.SelectedIndex == 0)
                    {
                        Errors.AppendLine("Выберите пол!");
                    }
                    if (string.IsNullOrEmpty(Email.Text))
                    {
                        Errors.AppendLine("Заполните почту!");
                    }
                    else
                    {
                        var EmailFromDB = Models.SportInventoryDBEntities.GetContext().Users.Where(d => d.Email == Email.Text).FirstOrDefault();
                        if (EmailFromDB != null)
                        {
                            Errors.AppendLine("Почта уже занята!");
                        }
                    }
                    if (string.IsNullOrEmpty(Login.Text))
                    {
                        Errors.AppendLine("Заполните логин!");
                    }
                    else
                    {
                        var LoginFromDB = Models.SportInventoryDBEntities.GetContext().Users.Where(d => d.Login == Login.Text).FirstOrDefault();
                        if(LoginFromDB != null)
                        {
                            Errors.AppendLine("Логин уже занят!");
                        }
                    }
                    if (string.IsNullOrEmpty(Password.Password))
                    {
                        Errors.AppendLine("Заполните пароль!");
                    }
                    else
                    {
                        if (Password.Password.Length < 8)
                        {
                            Errors.AppendLine("Пароль меньше 8 символов!");
                        }
                        if (Password.Password.ToLower() == Password.Password || Password.Password.ToUpper() == Password.Password)
                        {
                            Errors.AppendLine("Пароль должен быть в разном регистре!");
                        }
                        bool IsNumberThere = false;
                        bool IsSpecialCharThere = false;
                        foreach (var item in Password.Password)
                        {
                            if (char.IsDigit(item))
                            {
                                IsNumberThere = true;
                            }
                            if (char.IsSymbol(item) || char.IsSeparator(item) || char.IsPunctuation(item) )
                            {
                                IsSpecialCharThere = true;
                            }
                        }
                        if (IsNumberThere == false)
                        {
                            Errors.AppendLine("Пароль должен содержать в себе цифры!");
                        }
                        if (IsSpecialCharThere == false)
                        {
                            Errors.AppendLine("Пароль должен содержать в себе символы!");
                        }
                    }
                    if (string.IsNullOrEmpty(ConfirmPassword.Password))
                    {
                        Errors.AppendLine("Подтвердите пароль!");
                    }
                    if (Password.Password != ConfirmPassword.Password)
                    {
                        Errors.AppendLine("Пароль с подтверждением не сходятся!");
                    }
                    if (Errors.Length > 0)
                    {
                        MessageBox.Show(Errors.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                    CurrentUser = new Models.Users()
                    {
                        SecondName = SecondName.Text,
                        FirstName = FirstName.Text,
                        PatronomycName = PatronomycName.Text,
                        Birthday = (DateTime)DateBirthday.SelectedDate,
                        Email = Email.Text,
                        Phone = PhoneNumber.Text,
                        Login = Login.Text,
                        Password = Password.Password,
                        PasportSerial = null,
                        PasportNumber = null,
                        LastEntry = null,
                        TypeOfEntry = null,
                        SexId = SexName.SelectedIndex,
                        RoleId = RoleNameCombobox.SelectedIndex
                    };
                    Models.SportInventoryDBEntities.GetContext().Users.Add(CurrentUser);
                    Models.SportInventoryDBEntities.GetContext().SaveChanges();
                }
                MessageBox.Show("Данные сохранены!", "Уведомление!", MessageBoxButton.OK, MessageBoxImage.Information);
                Utils.Navigation.ActiveFrame.Navigate(new Pages.ListViewPage());
            }
            catch (Exception)
            {
                MessageBox.Show("Произошла ошибка!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}