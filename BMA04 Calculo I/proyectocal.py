#!/usr/bin/env python
# coding: utf-8

# In[45]:


pip install sympy #instalo la libreria SymPy


# In[46]:


from sympy import *
from sympy.plotting import plot
from sympy.abc import x
init_printing()
# importo las biblotecas correspondientes para realizar las operaciones


# In[47]:


f = 480*x -92*x**2 +4*x**3 #defino la funcion de mi problema


# In[48]:


df = diff(f, x) # Calcula la primera derivada usando el comando diff
df


# In[49]:


pc = solve(Eq(df, 0)) # Los puntos críticos los calculamos resolviendo la ecuación  f′(x)=0 
pc


# In[50]:


d2f = diff(f,x,2) # Calcula la segunda derivada usando el comando diff
d2f


# In[51]:


d2f.subs(x,pc[0]) # Sustituyendo los puntos críticos en  f′′(x) obtenemos el 1er punto critico


# In[52]:


d2f.subs(x,pc[1]) # Sustituyendo los puntos críticos en  f′′(x) obtenemos el 2do punto critico


# In[75]:


def maxminf(f): # defino una funcion mediante comando def, Calculamos los minimos y maximos de la funcion
    df = diff(f, x) # Primera derivada
    d2f = diff(f, x, 2) # Segunda derivada
    pcs = solve(Eq(df,0)) # Puntos críticos
    for p in pcs:
        if d2f.subs(x,p)>0: 
            tipo="Punto Minimo"
        elif d2f.subs(x,p)<0: 
            tipo="Punto Maximo"
        else: 
            tipo="Indefinido"
        print("x = %f (%s)"%(p,tipo))


# In[76]:


maxminf(480*x -92*x**2 +4*x**3) #El output de los maximos y minimos de la funcion anterior


# In[59]:


plot(f, (x, -104, 104)) #Usamos los puntos criticos para observar la conacavidad de la grafica


# In[56]:


480*(33.333) -92*(33.333)**2 +4*(33.333)**3 #sustituyo x para obtener el maximo volumen 


# In[ ]:




