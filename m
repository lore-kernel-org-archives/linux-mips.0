Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186840;
	b=fUGEAapT6sfW8RG3KVAX6CcVN2I33cmWpSWhw0HLNCNTm8g7MeEiR48adKjHlf13fLsw
	 TeQjGBo9V/IaB/bO522+iHLq6/uavE4yV2pTTG8hkXmTBUmZexo4H3AEkO6uhgjI1hjcr
	 QKTGe20+A+ap0QybyCQeh2JXF4kKDmHZnIU4daX/mnTob7eKqhUuwOa4d8k+febzBIqPF
	 +Il8QcXX8QYJY4SJqCqbOvPGF1yzY9y/kVNVjpJ7GNixWXoSXXHkmpt/ONKPxjdzYH7E9
	 sng4nFm0FUgZaUby1JF/ESXlFk9r95DQgSCuPXDeUptN95u2iPDcTbHJ4sOccAgswPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=hkTkGMTtUaKFrxnBbafQYRcaD7/eLuV7pxYbd80cjOQ=;
	b=aVrGBheAC8cEGhou8ksPeSffsHvWYnASkFN7lLVxCjCkXXgT2s1gQkDNDMz2FkyyepfD
	 fKH6QUoZp6o/6/QPSJ3bTFFPNTdZOqGJHXH4Fo1IDU6MfQNa8OBjNf3VzwV5b57/7Uk3+
	 BLmV9IRUr3QXzjsRUblp8ElK/H5PQMbCmNKrz2kN3e/c3ABtB2B97OeXj50+T+hcOXW4/
	 5r5UlSpB0UGOzu1B14CJ5aCr99bBPZYfg3c7OXhHVxEqDvNjDW8RR4AFoayixdbL2yZ+0
	 ssjoIMvHsleG2ShA1y3zZgWdmh40p8eBN9BXpj72jzM8NWHdjorWi02j5EMCVaa9pnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NF1d13go;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A774C6074D18
	for <linux-mips@vger.kernel.org>; Fri, 20 Nov 2026 15:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A774C6074D18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NF1d13go
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-49465892f7bso796187f8f.1
        for <linux-mips@vger.kernel.org>; Fri, 20 Nov 2026 07:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795186838; x=1795791638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hkTkGMTtUaKFrxnBbafQYRcaD7/eLuV7pxYbd80cjOQ=;
        b=NF1d13goE0X3h4LHbeoKQhvjOGCBgTjHfoH2p3U86EcjWwrH6x+A9wj31Xf8bxHqAg
         0JfL62Y6t6Ug6iFOc4WXvJiOicLSLI2QAsHmF/L16iloMf+HFXUBHbq6qh3D2pWobnD1
         omjeFcBljrsLUM02kqiWQUqPg+H5JZeaA5IKVIJKkokvBFPi3qy89h8voY8u/tmjlVqp
         NdhkAb2qqPGhGBnCRGSDDG2d0FuTI7BFs5qgEqjKmN0HYJn2ZlA3pEYQX1yRuCRwMdHm
         kC7TlHHagKgrFOorXsJeV1CTzUJer7fvuHVO5NrVIDvjMAZxcZRwHHcXXo67uV0ENjMU
         wXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186838; x=1795791638;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hkTkGMTtUaKFrxnBbafQYRcaD7/eLuV7pxYbd80cjOQ=;
        b=x5lanu4PPFAijZjPAwEZCt9zpqbEgkwCYWJovPtpRPuDDvCTTLoX1S0EMXSG5vDFdp
         YDq2y2KLCrHpoSM1Jo14F38KFZDfO3Ll6bQQkt5IWFAY1njurcZE5DHCdtyyqO9AhnyF
         dY/91H5guGVE2+P01VeJwzeOj4ktcRZnHICQJJHfN19z9r/NZMgQB9O7j615YJ4nc5qc
         fN+nsE+9kot0NH3x/EoPljycVb5IdL6isRmByue3+9n4a+enrK6/HP1DA3zJZ6jOFhE+
         8A4QotcjOvPqFeCJ313dvSZcgAyyefI/aJJvVmZZYAUks/BpwPRiU6r0fptlPdkyYXj6
         733g==
X-Gm-Message-State: APuU4Z8vYPRruYKFT0tFUEsD9ktIKAZFB2S8FK2gCHEWP3uDt8H/pMS7
	CVuNCBGX0P8gR2cQS8AZtEZFa4eKUSbQOWgJLKP8+MBllf0GunLd0YGkCsx4KYBa
X-Gm-Gg: AZFdTZdmFhjV7gPJtbpv/VYpU5tf/nEX8Vlb8b8dInVnLLVkN9yyC3NClUW4I5LOLbw
	zfMpFqfecf9Ge8zIv2JxWh6VbHu71hjhWzlOMGZBXpBUkq/xHHll20kzbpioqofbdF1yQEpgsU5
	g0wD0lbMPsyDOjr8jE0tvJM5T48jExqiGi0+UH40ym2WxXkEf/NevakUqR9svvj7Wlre866o0Xw
	dhKZxXpt1DVmid6W+/j7Zo+UjICIri8WsuSecQkJ/Vb0C9Rm8IyvP3gW9ZAs0fHT67Q3/Ocdr4G
	/wxPEH+5i0B8tOZkDhRqFF+oES3ATC6vq37a9UB3xW+EPo4K0fMV8KiuSFXLytcin5QztYTXrfc
	pp1j5fQIh+CNOOfvbmsCVT25FOFc4SQLwBncWOzm5DXMvg78FZ7MEXv3lpaTf/90j++6ij2j8HN
	V9KbtPZO3QgULbCSTu5Yody0ZIjz/5oUv9WlZyrcH1VKYhrYlKBgV+hrutpBCYcSEFFOhlmd8EL
	AOMIBIKPJPDzN57FmxpP0SCqdRbtskmriPaY3DjrG7G3DULss2q65o4/Qg8iK6q8F+mkxuIxb29
	/nPvcarjSGAwgqIW+sSaakElXV3w8pXQxAfGm9paMH8pTzIOp3Z/5woypT0ux4ClVQ==
X-Received: by 2002:a05:6000:2489:b0:48e:2108:4d28 with SMTP id ffacd0b85a97d-4abb1baaa3emr7219457f8f.13.1795186837816;
        Fri, 20 Nov 2026 07:00:37 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a680483sm6063058f8f.28.2026.11.20.07.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:00:37 -0800 (PST)
Date: Fri, 20 Nov 2026 15:00:35 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mips@vger.kernel.org, "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Paul Cercueil <paul@crapouillou.net>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] MIPS: Ingenic: Allow assembler reordering in the XBurst
 secondary entry
Message-ID: <20261120150035.4ccbad0c@pumpkin>
In-Reply-To: <20261120050827.804767-1-f.fainelli@gmail.com>
References: <20261120050827.804767-1-f.fainelli@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Nov 2026 21:08:26 -0800
Florian Fainelli <f.fainelli@gmail.com> wrote:

> Remove .set noreorder and the two explicit delay-slot nops from the
> XBurst secondary CPU reset entry. GNU as emits identical reset-entry
> instructions with reordering enabled in both the CI20 and generic
> MIPS64r2 Ingenic SMP builds.

If the ordering actually mattered then the fact that the current toolchain
doesn't break thinks isn't enough to guarantee that a future version
won't find some way of generating invalid code.

The explicit nop in the delay slots might even be there because there
is another reason for the .set noreorder.

If nothing else the commit message is misleading.

David

> 
> On CI20, two baseline and three updated cold boots brought both CPUs
> online. Each boot passed the CPU affinity check and 100 cross-core
> idle-wakeup round trips in each direction. Codex assisted with the
> assembly comparison and hardware test campaign.
> 
> Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
> Thomas, feel free to fixup into "MIPS: Ingenic: Add XBurst SMP support"
> if that is simpler. Thanks!
> 
>  arch/mips/ingenic/ingenic-smp-entry.S | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/mips/ingenic/ingenic-smp-entry.S b/arch/mips/ingenic/ingenic-smp-entry.S
> index 290e23c65707..d6aa4b4b1a17 100644
> --- a/arch/mips/ingenic/ingenic-smp-entry.S
> +++ b/arch/mips/ingenic/ingenic-smp-entry.S
> @@ -16,7 +16,6 @@
>  	/* The CP0 REIM register only stores the upper 16 address bits. */
>  	.section .text.smp-entry, "ax"
>  	.balign 0x10000
> -	.set noreorder
>  LEAF(xburst_secondary_cpu_entry)
>  	mtc0	zero, CP0_CAUSE
>  	li	t0, ST0_CU0
> @@ -32,7 +31,6 @@ LEAF(xburst_secondary_cpu_entry)
>  	cache	Index_Store_Tag_D, 0(t0)
>  	addiu	t0, t0, CACHE_LINESIZE
>  	bne	t0, t1, 1b
> -	 nop
>  
>  	mfc0	t0, CP0_CONFIG
>  	li	t1, ~CONF_CM_CMASK
> @@ -50,5 +48,4 @@ LEAF(xburst_secondary_cpu_entry)
>  
>  	PTR_LA	t0, smp_bootstrap
>  	jr	t0
> -	 nop
>  END(xburst_secondary_cpu_entry)

