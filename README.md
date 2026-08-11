<center>
<img src="logopim.png" height="100" width="100"/>
</center>

<h1 style="font-weight:bold;"> P/PIM</h1>
<h1 style="font-weight:bold;">What is PIM?</h1>
Pim is a interperter written in nim for P/. Also it for educational.
<h1>Current status</h1>
well, right now the project is in alpha mode. That means it's only released for debugging and it's full of bugs! And it's fixing problems and testing new features. So it's not suitable for use and it's not predictable to some extent. And it's more educational than industrial.
<h1>Examples</h1>
P/ is easy and really human-friendly. Since pim is small, it not support fully of P/.
<pre><code>
// gen is small alias for generate
gen string name = "Pouya"
gen write(name);  
</pre></code>

# Compile it yourself
To compile, you need to have the following prerequisites:
```nim - nimble```
(nimble will install auto with nim)

after download and install nim in your system, clone repository with ```git```:
```git clone https://github.com/pouya1dev/pim```
after that, open ```pim``` folder with ```cd pim``` and in ```src```, run ```nimble build```.
now, try it with ```./pim``` and enjoy.
