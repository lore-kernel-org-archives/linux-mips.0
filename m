Received: from yx-out-1718.google.com ([74.125.44.153]:61343 "EHLO
	yx-out-1718.google.com") by ftp.linux-mips.org with ESMTP
	id S20021665AbZDOGJD (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Wed, 15 Apr 2009 07:09:03 +0100
Received: by yx-out-1718.google.com with SMTP id 3so1816685yxi.24
        for <linux-mips@linux-mips.org>; Tue, 14 Apr 2009 23:09:01 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 15 Apr 2009 11:39:01 +0530
Message-ID: <d77cedf30904142309na4355e6w63ecea63b0966c92@mail.gmail.com>
Subject: in mips how to change the start address to the new second boot loader
	?
From: nagalakshmi veeramallu <lucky.veeramallu@gmail.com>
Content-Type: multipart/alternative; boundary=00163698966fac35d2046791c8bb
Return-Path: <lucky.veeramallu@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20090415060901.0bNP99JI-hetnVBXTMcWxqyRVcX594dKBD08cyAFGwA@z>

--00163698966fac35d2046791c8bb
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi ,
 I have a KMC board with mips VR4131 processor. The target board already
 having cmon boot loader on flash. Now I need to put my yamon boot loader
 which I modified according to the requirement on the flash. As we know MIPS
 have fixed starting address 0xbfc00000, how to change this address to other
 address so that after power on it can enter to the new address (boot
 loader).
If any one have some idea, please help me
Thanks in advance.



Regards,

Lucky

--00163698966fac35d2046791c8bb
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p class=3D"MsoNormal">Hi ,<br>
<span style=3D"mso-spacerun:yes">=A0</span>I have a KMC board with mips VR4=
131
processor. The target board already<br>
<span style=3D"mso-spacerun:yes">=A0</span>having cmon boot loader on flash=
. Now I
need to put my yamon boot loader<br>
<span style=3D"mso-spacerun:yes">=A0</span>which I modified according to th=
e
requirement on the flash. As we know MIPS<br>
<span style=3D"mso-spacerun:yes">=A0</span>have fixed starting address 0xbf=
c00000,
how to change this address to other<br>
<span style=3D"mso-spacerun:yes">=A0</span>address so that after power on i=
t can
enter to the new address (boot<br>
<span style=3D"mso-spacerun:yes">=A0</span>loader).<br>
If any one have some idea, please help me<br>
Thanks in advance.</p>

<p class=3D"MsoNormal">=A0</p>

<p class=3D"MsoNormal">Regards,</p>

<p class=3D"MsoNormal">Lucky</p>

--00163698966fac35d2046791c8bb--
