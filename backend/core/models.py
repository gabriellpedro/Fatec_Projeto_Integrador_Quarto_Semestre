from django.db import models

class MaterialsbyState(models.Model):
	"""docstring for MaterialsbyState"""
	def __init__(self):
		state = models.CharField(max_length=10)
		paper = models.CharField(max_length=10000)
		plastic = models.CharField(max_length=10000)
		glass = models.CharField(max_length=10000)
		steel = models.CharField(max_length=10000)
		cooperatives = models.CharField(max_length=10000)

