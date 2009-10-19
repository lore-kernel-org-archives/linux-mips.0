Received: from mail-vw0-f199.google.com ([209.85.212.199]:62481 "EHLO
	mail-vw0-f199.google.com" rhost-flags-OK-OK-OK-OK)
	by ftp.linux-mips.org with ESMTP id S1492004AbZJSFR6 (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Mon, 19 Oct 2009 07:17:58 +0200
MIME-Version: 1.0
In-Reply-To: <1255819715-19763-1-git-send-email-linus.walleij@stericsson.com>
References: <1255819715-19763-1-git-send-email-linus.walleij@stericsson.com>
Date: Sun, 18 Oct 2009 23:17:47 -0600
Message-ID: <b2b2f2320910182217m31ce0a96g4912eeb9bea5f817@mail.gmail.com>
Subject: Re: [PATCH] Make MIPS dynamic clocksource/clockevent clock code
	generic
From: Shane McDonald <mcdonald.shane@gmail.com>
Content-Type: multipart/alternative; boundary=001517576e08ce08ab047642dd3b
Return-Path: <mcdonald.shane@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Linus Walleij <linus.walleij@stericsson.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@linux-mips.org, Thomas Gleixner <tglx@linutronix.de>, Mikael Pettersson <mikpe@it.uu.se>, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20091019051747.fpS4pmi8fHf4-f01ltJPtc-fbOOH97QmcM-n9ye0wts@z>

--001517576e08ce08ab047642dd3b
Content-Type: text/plain; charset=ISO-8859-1

Hello:

On Sat, Oct 17, 2009 at 4:48 PM, Linus Walleij <linus.walleij@stericsson.com
> wrote:

> This moves the clocksource_set_clock() and clockevent_set_clock()
> from the MIPS timer code into clockchips and clocksource where
> it belongs. The patch was triggered by code posted by Mikael
> Pettersson duplicating this code for the IOP ARM system. The
> function signatures where altered slightly to fit into their
> destination header files, unsigned int changed to u32 and inlined.
>
> Signed-off-by: Linus Walleij <linus.walleij@stericsson.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Mikael Pettersson <mikpe@it.uu.se>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> ---
> Ralf has stated in earlier conversation that this should be moved,
> now we risk duplicating code so let's move it.
>
> I don't have access to a MIPS cross-compiler so please can the
> MIPS people test this?
>

I have tested this patch on an RM7000-based MIPS system.  The patch compiles
fine, and the kernel successfully runs.  You can add my:

Tested-by: Shane McDonald <mcdonald.shane@gmail.com>

Shane

--001517576e08ce08ab047642dd3b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello:<br><br>On Sat, Oct 17, 2009 at 4:48 PM, Linus Walleij <span dir=3D"l=
tr">&lt;<a href=3D"mailto:linus.walleij@stericsson.com">linus.walleij@steri=
csson.com</a>&gt;</span> wrote:<br><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, 204, 204); ma=
rgin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
This moves the clocksource_set_clock() and clockevent_set_clock()<br>
from the MIPS timer code into clockchips and clocksource where<br>
it belongs. The patch was triggered by code posted by Mikael<br>
Pettersson duplicating this code for the IOP ARM system. The<br>
function signatures where altered slightly to fit into their<br>
destination header files, unsigned int changed to u32 and inlined.<br>
<br>
Signed-off-by: Linus Walleij &lt;<a href=3D"mailto:linus.walleij@stericsson=
.com">linus.walleij@stericsson.com</a>&gt;<br>
Cc: Thomas Gleixner &lt;<a href=3D"mailto:tglx@linutronix.de">tglx@linutron=
ix.de</a>&gt;<br>
Cc: Mikael Pettersson &lt;<a href=3D"mailto:mikpe@it.uu.se">mikpe@it.uu.se<=
/a>&gt;<br>
Cc: Ralf Baechle &lt;<a href=3D"mailto:ralf@linux-mips.org">ralf@linux-mips=
.org</a>&gt;<br>
---<br>
Ralf has stated in earlier conversation that this should be moved,<br>
now we risk duplicating code so let&#39;s move it.<br>
<br>
I don&#39;t have access to a MIPS cross-compiler so please can the<br>
MIPS people test this?<br></blockquote></div><br>I have tested this patch o=
n an RM7000-based MIPS system.=A0 The patch compiles fine, and the kernel s=
uccessfully runs.=A0 You can add my:<br><br>Tested-by: Shane McDonald &lt;<=
a href=3D"mailto:mcdonald.shane@gmail.com">mcdonald.shane@gmail.com</a>&gt;=
<br>
<br>Shane<br>

--001517576e08ce08ab047642dd3b--
