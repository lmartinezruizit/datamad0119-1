# Member class
class Member:

    def __init__(self, name, joined, status, city, country, is_pro_admin):
        self.name = name
        self.bio = ''
        self.joined = joined
        self.status = status
        self.city = city
        self.country = country
        self.is_pro_admin = is_pro_admin
        self.role = ''
        self.photo = ''
        self.question = ''
        self.answer = ''
        self.groups = []

    #get_name method
    def get_name(self):
        return self.name

    #set_name method
    def set_name(self,name):
        self.name = name

    #get_bio method
    def get_bio(self):
        return self.bio 

    #set_bio method
    def set_bio(self,bio):
        self.bio = bio

    #get_joined method
    def get_joined(self):
        return self.joined

    #set_joined method
    def set_joined(self,joined):
        self.joined = joined

    #get_status method
    def get_status(self):
        return self.status

    #set_status method
    def set_status(self,status):
        self.status = status

    #get_city method
    def get_city(self):
        return self.city 

    #set_city method
    def set_city(self,city):
        self.city = city

    #get_country method
    def get_country(self):      
        return self.country
    
    #set_country method
    def set_country(self,country):
        self.country = country

    #get_is_pro_admin method
    def get_is_pro_admin(self):
        return self.is_pro_admin

    #set_is_pro_admin method
    def set_is_pro_admin(self,is_pro_admin):
        self.is_pro_admin = is_pro_admin

    #get_role method
    def get_role(self):
        return self.role

    #set_role method
    def set_role(self,role):
        self.role = role

    #get_photo method
    def get_photo(self):
        return self.photo 

    #set_photo method
    def set_photo(self,photo):
        self.photo = photo

    #get_answer method
    def get_answer(self):
        return self.answer

    #set_answer method
    def set_answer(self,question,answer):
        self.question = question
        self.answer = answer

    #get_groups method
    def get_groups(self):
        return self.groups

    #set_groups method    
    def set_groups(self,groups):
        self.groups = groups

    #get_as_dict method
    def get_as_dict(self):
        return {
            'name': self.name,
            'bio': self.bio,
            'joined': self.joined,
            'status': self.status,
            'city': self.city,
            'country': self.country,
            'is_pro_admin': self.is_pro_admin,
            'role': self.role,
            'photo': self.photo,
            'answer': self.question + ': ' + self.answer if self.answer else '',
            'groups': self.groups
        }
