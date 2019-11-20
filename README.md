<!-- #######  YAY, I AM THE SOURCE EDITOR! #########-->
<h1><span style="color: #000000;">Chill, thinkpad!</span></h1>
<h1><span style="color: #000000; font-size: 14px;">This is a little script I created to handle power profiles on my Thinkpad while using Ubuntu - My computer was running really hot while using linux and I finally got this solved by using this script which modifies Intel PState power profiles.</span></h1>
<h2 style="color: #2e6c80;"><span style="color: #000000;">Usage:</span></h2>
<table class="editorDemoTable" style="height: 263px;" width="611">
<thead>
<tr>
<td style="width: 255px;">Command</td>
<td style="width: 338px;">What it does</td>
</tr>
</thead>
<tbody>
<tr>
<td style="width: 255px;">
<blockquote>./tpchill.sh pf</blockquote>
</td>
<td style="width: 338px;">Will set the power profile to Performance (Intel Turbo enabled, whole range of frequencies using Performance governor)</td>
</tr>
<tr>
<td style="width: 255px;">
<blockquote>./tpchill.sh ps</blockquote>
</td>
<td style="width: 338px;">Will set the power profile to Powersave (Intel Turbo disabled, whole range of frequencies using Powersave governor)</td>
</tr>
<tr>
<td style="width: 255px;">
<blockquote>./tpchill.sh psx</blockquote>
</td>
<td style="width: 338px;">Will set the power profile to Powersave Extreme (Intel Turbo disabled, only the lowest frequency for the CPUs is used, Powersave governor selected)</td>
</tr>
</tbody>
</table>
<p><strong>&nbsp;</strong></p>
<p><strong>Author: Rodrigo Marras</strong></p>
<p><strong>email: rodri@marras.com.ar&nbsp;</strong></p>
