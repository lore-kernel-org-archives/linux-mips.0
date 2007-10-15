Received: from py-out-1112.google.com ([64.233.166.179]:14812 "EHLO
	py-out-1112.google.com") by ftp.linux-mips.org with ESMTP
	id S20027085AbXJOHfC (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Mon, 15 Oct 2007 08:35:02 +0100
Received: by py-out-1112.google.com with SMTP id p76so2977666pyb
        for <linux-mips@linux-mips.org>; Mon, 15 Oct 2007 00:34:40 -0700 (PDT)
Message-ID: <eea8a9c90710150034m40be367cmae5a42c028592c8c@mail.gmail.com>
Date: Mon, 15 Oct 2007 13:04:40 +0530
From: kaka <share.kt@gmail.com>
Subject: insmod: Cannot insert Framebuffer_Driver.ko unknown symbol in module(urgent)
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_Part_1216_32461206.1192433680503"
Return-Path: <share.kt@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org, uclinux-dev@uclinux.org, linux-fbdev-users@lists.sourceforge.net.
Message-ID: <20071015073440.QEmzPFl3xcar_brNCCEsCntK01Wcd5wI3bBNCxvgTTo@z>

------=_Part_1216_32461206.1192433680503
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi All,

we have wriitten a framebuffer driver for MIPS platform(cross compiled at
intel86 linux box).
We are installing it by insmod command.
Then we are getting the following error.
Framebuffer_Driver.ko  Cannot insert Framebuffer_Driverko unknown symbol in
module(8) no such file or directory
Also it has some code and function for propertiary graphics code.
For that i have we have added supplementary <supp.ko> file to be linked with
the main frame buffer driver (Framebuffer_Driver.ko )
in the makefile to provide the reference for the symbols for the propertiary
graphics code.
We have added the line LICENCE_MODULE(GPL) in main frame buffer driver
code(Framebuffer_Driver.ko ).

It is giving error that multiple definition of init_module function.
i guess 1 for Framebuffer_Driver.ko  and the other supplementary <supp.ko>
which is linked in the make file.

Could anybody please help to resolve the error?
Thanks in advance.

Regards,
kaka


-- 
Thanks & Regards,
kaka

-- 
Thanks & Regards,
kaka

-- 
Thanks & Regards,
kaka

-- 
Thanks & Regards,
kaka

------=_Part_1216_32461206.1192433680503
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>Hi All,</div>
<div>&nbsp;</div>
<div>we have wriitten a framebuffer driver for MIPS platform(cross compiled at intel86 linux box).</div>
<div>We are installing it by insmod command.</div>
<div>Then we are getting the following error.</div>
<div>Framebuffer_Driver.ko &nbsp;Cannot insert Framebuffer_Driverko unknown symbol in module(8) no such file or directory<br>Also it has some code and function for propertiary graphics code.</div>
<div>For that i have we have added supplementary &lt;supp.ko&gt; file to be linked with the main frame buffer driver (Framebuffer_Driver.ko )</div>
<div>in the makefile to provide the reference for the symbols for the propertiary graphics code.</div>
<div>We have added the line LICENCE_MODULE(GPL) in main frame buffer driver code(Framebuffer_Driver.ko ).</div>
<div>&nbsp;</div>
<div>It is&nbsp;giving error&nbsp;that multiple definition of init_module function.</div>
<div>i guess 1 for Framebuffer_Driver.ko&nbsp; and the other supplementary &lt;supp.ko&gt; which is linked in the make file.</div>
<div>&nbsp;</div>
<div>Could&nbsp;anybody please help to resolve the error?</div>
<div>Thanks in advance.<br>&nbsp;</div>
<div>Regards,</div>
<div>kaka</div><br clear="all"><br>-- <br>Thanks &amp; Regards,<br><span>kaka </span><br clear="all"><br>-- <br>Thanks &amp; Regards,<br><span>kaka </span><br clear="all"><br>-- <br>Thanks &amp; Regards,<br><span class="sg">
kaka </span><br clear="all"><br>-- <br>Thanks &amp; Regards,<br>kaka 

------=_Part_1216_32461206.1192433680503--
