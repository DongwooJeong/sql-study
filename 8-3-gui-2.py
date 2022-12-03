from tkinter import *
from tkinter import messagebox

def clickButton():
    messagebox.showinfo('click button', "clicked the button...")

root = Tk()
root.geometry("200x200")

button1 = Button(root, text="click here", fg="red", bg="yellow", command=clickButton)
button1.pack(expand=1)

root.mainloop()

