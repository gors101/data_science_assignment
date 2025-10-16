import pandas as pd
import matplotlib.pyplot as plt

#从csv file中读取数据
df_users = pd.read_csv("data/users.csv")
df_events = pd.read_csv("data/events.csv")


#检查是否有Null值或格式问题
print("Checking for null and datatypes...")
print(df_users.info())
print(df_events.info())
#上述检查没有问题


#检查并删除类型为“object” 的 cell 值的多余空格
print("\nTrimming...")
df_users = df_users.apply(lambda x:x.str.strip() if x.dtype == "object" else x)
df_events = df_events.apply(lambda x:x.str.strip() if x.dtype == "object" else x)
print("Done trimming.\n")


#检查是否有重复值，
print("Looking for duplicated email or user_id in users.csv...")
print(df_users[df_users.duplicated(subset=["user_id"])])
print(df_users[df_users.duplicated(subset=["email"])])
print("\nFinding duplicate rows from events.csv")
print(df_events[df_events.duplicated()])
print("Done finding duplicated data\n")


#convert date datatypes
print("\nconverting the datetime and date into datetime format with date only...")
df_users["signup_date"] = pd.to_datetime(df_users["signup_date"], format='%Y-%m-%d')
df_events["timestamp"] = pd.to_datetime(df_events["timestamp"], format='%Y/%m/%d %H:%M')
print("Converting is done.\n")


#检查
print(df_users.head())
print(df_users.info())
print(df_events.head())
print(df_events.info())



#用户性别分布图
gender_count = df_users.groupby("gender")["gender"].count()
gender_count.plot(kind="pie", title="User's distribution of gender", autopct = lambda x: "%.2f%%" % x)
plt.show()



#用户年龄分布直方图
age_count = df_users.groupby("age")["age"].count()
age_count.plot(kind="bar", title="Age distribution of users", y="value")
plt.show()


#注册日期趋势图
signup_count = df_users.groupby("signup_date")["signup_date"].count()
signup_count.plot(kind="line", title="Distribution of signup date", y="value")
plt.show()