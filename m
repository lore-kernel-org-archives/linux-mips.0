Received: from an-out-0708.google.com ([209.85.132.246]:27655 "EHLO
	an-out-0708.google.com") by ftp.linux-mips.org with ESMTP
	id S20024295AbZDUNqY (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Tue, 21 Apr 2009 14:46:24 +0100
Received: by an-out-0708.google.com with SMTP id c37so1229917anc.24
        for <linux-mips@linux-mips.org>; Tue, 21 Apr 2009 06:46:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <49EDC965.60507@paralogos.com>
References: <d77cedf30904142309na4355e6w63ecea63b0966c92@mail.gmail.com>
	 <200904201100.39164.florian@openwrt.org>
	 <20090420.085929.-1089997132.imp@bsdimp.com>
	 <d77cedf30904202350g602c740dh26641f145677ddd5@mail.gmail.com>
	 <49EDC965.60507@paralogos.com>
Date: Tue, 21 Apr 2009 19:16:19 +0530
Message-ID: <d77cedf30904210646v2ea71655ye83c8b57fecab761@mail.gmail.com>
Subject: Re: in mips how to change the start address to the new second boot
	loader ?
From: nagalakshmi veeramallu <lucky.veeramallu@gmail.com>
Content-Type: multipart/alternative; boundary=0016e644c37e2748f6046810df8c
Return-Path: <lucky.veeramallu@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "Kevin D. Kissell" <kevink@paralogos.com>
Cc: "M. Warner Losh" <imp@bsdimp.com>, florian@openwrt.org, linux-mips@linux-mips.org
Message-ID: <20090421134619.jEZjyBLBD2kCKXoIeccPBqat5w7hFlrLcVW16xkdcDY@z>

--0016e644c37e2748f6046810df8c
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

hi,
         --          if we set environmental variable =93start=94 as =93go
new_address=94, will it go directly to the new bootloader in the next
power-on.

what about using system environmental "start" ,can you tell me at which
context after power on environmental variables come onto picture.

Regards,
Lucky

On Tue, Apr 21, 2009 at 6:55 PM, Kevin D. Kissell <kevink@paralogos.com>wro=
te:

>  nagalakshmi veeramallu wrote:
>
>  -           Mips atlas board has jumper  which will redirect accesses
> from =93Bootcode=94 range to either =93Monitor flash=94 (0x1e000000) or t=
he upper
> 4MB of =93System flash=94 (0x1dc00000) based on jumper settings. if my km=
c
> board have some jumper like this, can I redirect the start address.
>
> Of course, what is really happening there is that the Atlas boot ROM has =
a
> vector at 0x1fc00000 which reads the jumper and jumps to one address or t=
he
> other depending on the jumper setting. If you control what is in ROM at
> 0x1fc00000 and you have a software-readable jumper on your KMC board, you
> can do the same thing.
>
>           Regards,
>
>           Kevin K.
>
>

--0016e644c37e2748f6046810df8c
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

hi,<div><br></div><div>=A0=A0 =A0 =A0 =A0 -<span class=3D"Apple-style-span"=
 style=3D"border-collapse: collapse; "><span style=3D"font-size: 10pt; font=
-family: Arial; color: black; "><span>-<span style=3D"font: normal normal n=
ormal 7pt/normal &#39;Times New Roman&#39;; ">=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0</span></span></span><span style=3D"font-size: 10pt; font-family: Arial;=
 color: black; ">if we set environmental variable =93start=94 as =93go new_=
address=94, will it go directly to the new bootloader in the next power-on.=
</span></span></div>
<div><div><span class=3D"Apple-style-span" style=3D"border-collapse: collap=
se;"><br></span></div><div>what about using system environmental &quot;star=
t&quot; ,can you tell me at which context after power on environmental vari=
ables come onto picture.</div>
<div><br></div><div>Regards,</div><div>Lucky<br><br><div class=3D"gmail_quo=
te">On Tue, Apr 21, 2009 at 6:55 PM, Kevin D. Kissell <span dir=3D"ltr">&lt=
;<a href=3D"mailto:kevink@paralogos.com">kevink@paralogos.com</a>&gt;</span=
> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex;">


 =20
 =20

<div bgcolor=3D"#ffffff" text=3D"#000000"><div class=3D"im">
nagalakshmi veeramallu wrote:
<blockquote type=3D"cite">
  <p><span style=3D"font-size:10pt;font-family:Arial;color:black"><span></s=
pan></span></p>
  <p style=3D"margin-left:0.5in;text-indent:-0.25in"><span style=3D"font-si=
ze:10pt;font-family:Arial;color:black"><span>-<span style=3D"font-family:&q=
uot;Times New Roman&quot;;font-style:normal;font-variant:normal;font-weight=
:normal;font-size:7pt;line-height:normal;font-size-adjust:none;font-stretch=
:normal">=A0=A0=A0=A0=A0=A0=A0=A0=A0
  </span></span></span><span style=3D"font-size:10pt;font-family:Arial;colo=
r:black"><span>=A0</span>Mips atlas board has jumper
  <span>=A0</span>which will redirect accesses from =93Bootcode=94
range to either =93Monitor flash=94 (0x1e000000) or the upper 4MB of
=93System flash=94
(0x1dc00000) based on jumper settings. if<span>=A0</span>my kmc
board have some jumper like this, can I redirect the start address.</span><=
/p>
</blockquote></div>
Of course, what is really happening there is that the Atlas boot ROM
has a vector at 0x1fc00000 which reads the jumper and jumps to one
address or the other depending on the jumper setting. If you control
what is in ROM at 0x1fc00000 and you have a software-readable jumper on
your KMC board, you can do the same thing.<br>
<br>
=A0=A0=A0 =A0=A0 =A0=A0 Regards,<br>
<br>
=A0=A0=A0 =A0=A0 =A0=A0 Kevin K.<br>
<br>
</div>

</blockquote></div><br></div></div>

--0016e644c37e2748f6046810df8c--
