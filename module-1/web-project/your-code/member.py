
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

    def get_name(self):
        return self.name
    
    def set_name(self,name):
        self.name = name

    def get_bio(self):
        return self.bio 

    def set_bio(self,bio):
        self.bio = bio

    def get_joined(self):
        return self.joined

    def set_joined(self,joined):
        self.joined = joined

    def get_status(self):
        return self.status

    def set_status(self,status):
        self.status = status

    def get_city(self):
        return self.city 

    def set_city(self,city):
        self.city = city

    def get_country(self):      
        return self.country
    
    def set_country(self,country):
        self.country = country

    def get_is_pro_admin(self):
        return self.is_pro_admin

    def set_is_pro_admin(self,is_pro_admin):
        self.is_pro_admin = is_pro_admin

    def get_role(self):
        return self.role

    def set_role(self,role):
        self.role = role

    def get_photo(self):
        return self.photo 
    
    def set_photo(self,photo):
        self.photo = photo

    def get_answer(self):
        return self.answer

    def set_answer(self,question,answer):
        self.question = question
        self.answer = answer

    def get_groups(self):
        return self.groups

    def set_groups(self,groups):
        self.groups = groups

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
