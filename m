Return-Path: <owner-linux@cthulhu.engr.sgi.com>
Message-ID: <m107n69-0007U1C@the-village.bc.nu>
From: alan@lxorguk.ukuu.org.uk (Alan Cox)
Subject: Re: weird HAL2
Date: Tue, 2 Feb 1999 21:11:04 +0000 (GMT)
In-Reply-To: <19990202205328.A1996@bun.falkenberg.se> from "Ulf Carlsson" at Feb 2, 99 08:53:28 pm
Content-Type: text
Sender: owner-linux@cthulhu.engr.sgi.com
To: Ulf Carlsson <ulfc@bun.falkenberg.se>
Cc: alambie@rock.csd.sgi.com, linux@cthulhu.engr.sgi.com
Message-ID: <19990202211104.RaQPfzDlBhQYH4gesvv_k-GL_9gargGAXiwx2DeKjsM@z>

> This is exactly what I'm trying to do by first writing 0x0000 to isr, waiting
> some us, and then writing 0x0018. Then the card should be active and isr should
> IMHO contain 0x0018.

Stupid question but does

write 0x0010
wait 10uS
write 0x0018

work ?

(ie do you have to bring them out of reset card, then codec ?
