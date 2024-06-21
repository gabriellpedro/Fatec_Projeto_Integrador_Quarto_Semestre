from django import forms

class UserForm(forms.Form):
    email = forms.CharField(label= "email", max_length=50)
    password = forms.CharField(label= "password", max_length=50, widget=forms.PasswordInput())
    confirm_password = forms.CharField(label= "confirm_password", max_length=50, widget=forms.PasswordInput())
    name = forms.CharField(label="name", max_length=100)


    def clean_password(self):
        password = self.cleaned_data['password']
        return password
    
    def clean_confirm_password(self):
        confirm_password = self.cleaned_data['confirm_password']
        return confirm_password
    
    def clean_email(self):
        email = self.cleaned_data['email']
        return email

    def clean(self):
        self.cleaned_data = super().clean()
        return self.cleaned_data
