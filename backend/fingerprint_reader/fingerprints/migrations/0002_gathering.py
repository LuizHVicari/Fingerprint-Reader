# Generated by Django 5.0.6 on 2024-07-04 19:32

import django.core.validators
import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('fingerprints', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Gathering',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fingerprint', models.ImageField(upload_to='')),
                ('months', models.IntegerField(validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(12)])),
                ('created_at', models.DateTimeField(auto_now=True)),
                ('updated_at', models.DateTimeField(auto_now_add=True)),
                ('baby', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='fingerprints.baby')),
            ],
        ),
    ]
