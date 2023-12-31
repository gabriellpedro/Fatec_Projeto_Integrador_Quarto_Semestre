# Generated by Django 4.1.9 on 2023-11-11 23:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0002_alter_recyclebalance_user_id'),
    ]

    operations = [
        migrations.CreateModel(
            name='MaterialsToRecycle',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('last_updated', models.DateTimeField(auto_now_add=True)),
                ('price', models.FloatField(unique=True)),
                ('name', models.CharField(max_length=150, unique=True)),
                ('mesure_unity', models.CharField(max_length=50, unique=True)),
                ('is_active', models.BooleanField(default=True)),
            ],
        ),
    ]
