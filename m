Received: from ey-out-1920.google.com ([74.125.78.145]:6744 "EHLO
	ey-out-1920.google.com") by ftp.linux-mips.org with ESMTP
	id S29039707AbZDUOKX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Tue, 21 Apr 2009 15:10:23 +0100
Received: by ey-out-1920.google.com with SMTP id 13so457431eye.54
        for <linux-mips@linux-mips.org>; Tue, 21 Apr 2009 07:10:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <d77cedf30904210646v2ea71655ye83c8b57fecab761@mail.gmail.com>
References: <d77cedf30904142309na4355e6w63ecea63b0966c92@mail.gmail.com>
	 <200904201100.39164.florian@openwrt.org>
	 <20090420.085929.-1089997132.imp@bsdimp.com>
	 <d77cedf30904202350g602c740dh26641f145677ddd5@mail.gmail.com>
	 <49EDC965.60507@paralogos.com>
	 <d77cedf30904210646v2ea71655ye83c8b57fecab761@mail.gmail.com>
Date: Tue, 21 Apr 2009 16:10:20 +0200
Message-ID: <10f740e80904210710sdc9e5c2ic310e689ca6677b5@mail.gmail.com>
Subject: Re: in mips how to change the start address to the new second boot
	loader ?
From: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-Path: <geert.uytterhoeven@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: nagalakshmi veeramallu <lucky.veeramallu@gmail.com>
Cc: "Kevin D. Kissell" <kevink@paralogos.com>, "M. Warner Losh" <imp@bsdimp.com>, florian@openwrt.org, linux-mips@linux-mips.org
Message-ID: <20090421141020.g1c-PY6rb6XPxdc6FuC0_2-sl4wTOy16L1uztrtmFkU@z>

On Tue, Apr 21, 2009 at 15:46, nagalakshmi veeramallu
<lucky.veeramallu@gmail.com> wrote:
> hi,
>          --          if we set environmental variable “start” as “go
> new_address”, will it go directly to the new bootloader in the next
> power-on.
> what about using system environmental "start" ,can you tell me at which
> context after power on environmental variables come onto picture.

Environment variables are parsed by the boot loader, whose code resides at,
guess what, 0x1fc00000...

> On Tue, Apr 21, 2009 at 6:55 PM, Kevin D. Kissell <kevink@paralogos.com>
> wrote:
>>
>> nagalakshmi veeramallu wrote:
>>
>> -           Mips atlas board has jumper  which will redirect accesses from
>> “Bootcode” range to either “Monitor flash” (0x1e000000) or the upper 4MB of
>> “System flash” (0x1dc00000) based on jumper settings. if my kmc board have
>> some jumper like this, can I redirect the start address.
>>
>> Of course, what is really happening there is that the Atlas boot ROM has a
>> vector at 0x1fc00000 which reads the jumper and jumps to one address or the
>> other depending on the jumper setting. If you control what is in ROM at
>> 0x1fc00000 and you have a software-readable jumper on your KMC board, you
>> can do the same thing.
>>
>>           Regards,
>>
>>           Kevin K.
>>
>
>



-- 
Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
