-- Databricks notebook source
Q1: How many subscribers does Bright Tv have?

select count(*) as total_subsribers
from bright_tv_dataset.bright_tv.user_profiles_dataset

