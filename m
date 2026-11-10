Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794278146;
	b=doiLehpTYH2j6r3mgaw0qqmQ7gztrJNityOCejZxwSPc1mi4t8j1zykaWL8YOn+jbUZS
	 XoDjHD+LfT+c7fx7GBn7frlmiiFSiBDILZnKJsqEnhLATQ6AUSaZ7yW65wStwMomSX+tr
	 /nCXFJC3sSGqIalEYP9vm1ZfCm5ubdyHLYGHFbTAaznT5AgtmgSs13Cb14/LuSOGeT13m
	 17r4UMmtU0/1+gd/aqNuHH/Bnvj1dx0jGhZ7DBh+StsZWzZ5X33T6b1Iuo/CmhnniI0hW
	 5uN9c30o3nI28GVFHV/IjVuVfh+xkrPxrP7Isgr7yLjhGuCXp4v3GnmeRrOmZOMb2gw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BbaQv55LLw86So2eGUmzZSVYmgLolt+j026ggWtATLs=;
	b=f6nmm95PZ2TjcwGacJC2C4PG5kJ4Md+sX0LPFaGPX7PfVsqQ4njR7N/gFGiVpYYQPEeL
	 w9bVmlRA04m1f0PYy6aNqwl1kXQ6n9Gx1IBUEP8TgS/4MkO4iBGL0UBF+NTYvz4fk/+Gi
	 uG59Cb430fZofyo7U9/+VXg7FB/XwkNyxbzrjDypZiHVDvXOWMqjuPkKRFMhLTh9meNBJ
	 3tFOPe9RYVmhVhuzb5Ke1f+UyxPDC5G7ItbNkTJFfGqNQvC8ysV7qlkMFJuGfpHxXxscV
	 FxWpbovN9KkEGCMv2t0FhkaS8UNEfkrdBQr66ciD/ZtLIVw1cwTaCAGeQWR7jHzVXOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eWeSr5r5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C748D606A336
	for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 02:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C748D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eWeSr5r5
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b70d5b07faso1897279a12.0
        for <linux-mips@vger.kernel.org>; Mon, 09 Nov 2026 18:35:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794278144; cv=none;
        d=google.com; s=arc-20260327;
        b=FiA62oXgrackUpk5l0QDyph04UloaXEG6DlKS3pMeM0n7JhUFICc5+HgRyKxKJcrRn
         0Um6hWClSDSsP/LkFNjGMl8Qx7udj3fRNi8eQ7ARct+7dOvo4KeQIjwGs3NY5VL+BZbh
         GgJPzesdZIwHpLCc/EBntyycJe6r7bbQWt9gPOPPsewbl1m2eaWvUmV6PZF62Feuo0gI
         cfn3ugcIf/vkOaWC36Z5mNL5b+orIMzNM3DreEBajvflk3y5fYi2/0z9qTCWUklX28ki
         qCpkzeeBDW0GVmHC29mZRUKP78yAD/apmiST9FgrZ5O1J4MVqW5WasMfIJmBu699mZpH
         aktQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BbaQv55LLw86So2eGUmzZSVYmgLolt+j026ggWtATLs=;
        fh=aRn/q/BtYrRSCIuWyK7AX5ZtanP7l5yxixK+5nOiPbA=;
        b=HsyxAM+U7P1M4kl2V1dxXj6nIYuenjFx8opxZ+eD0khteXNqRjgygfNez+Fv2w6LzF
         dRjbbEF6EGQPY52YhwRxhzGa//tElW4z0TExR7aUwBmfwDE0uHr8laR+K/tm3M/mwDu8
         ozfM5TNfUYku3c8zMSWP+/bv9sK6I6UVgSIRxKbBE0hihZ/XUbyn2FY+6uZW8FMBF+ej
         GSeyKfDWmixBjZKDhOEXxBgrIDGAxvs9EaeO0VZE4urgWVj1nUTMdRV+RxzyqtBtHh0Z
         /nBTgHFziGdgDfVBDOBszSVB1trZx7+QikloCtjRcVXjc65jFgzUegFqcgycOkMveqRP
         pBpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794278144; x=1794882944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BbaQv55LLw86So2eGUmzZSVYmgLolt+j026ggWtATLs=;
        b=eWeSr5r5o4b1bkqYgjtJbC3rvhYpbz3xWgu0aFWS22hceYif1O3IQXjrS3egH1On7Y
         KX2rRkHlzyj9L1BWTMksqurfYziKbAMiQ/sLsnW2woDzPSHgBnaBJkAHN9eMGje7En8F
         hmedJE2eyTyBa0d220Zu2/+RfZYbFaZSycyh9uhIuIfnwXcRYUnaPlgIB04++iJw4rMZ
         zlt+wbkvaTn9Su/9+0JxBb+QzhIuCezceOZaJHA7ngx38wdX5AXaFTH3QQ6G3bMIDWo7
         a57FxHRfYEDzvyHNNLpvVnxr/9YhRNWLNU4jxDGHiMM8iGpaZNV+iJoblOzKcHB10bum
         VEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278144; x=1794882944;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BbaQv55LLw86So2eGUmzZSVYmgLolt+j026ggWtATLs=;
        b=NV7BhvmERcj4k7Dmx4vndVWrRaJq1gq3F2xn6O6QMicqPkn64LFquQ+qWRFfdMK7VI
         gSUcttanWnJyp0mggV2r9CBwhTTJoLzKI0F3wqCxA3PCRTtqklUPOUFGrOuiX2UDjH+y
         Sqy7LIafK3R9GwjfiY38R8g6H1z85vhuZfrrLIHbSj3pMLZB1/54cmfCb9MuJuOobHgj
         hXXdfYvl6gT1tNRmyNZei9SppMWWpXlsXCuh9kn18XLyvqejSevuM0iViq3zPP5MTvGy
         r034OXTrqPJMWabOmenaBEvnbqA3mHiJ5pWNHS7eyu6Dh4lXMDdjAzlbqgzJ8dmSerL8
         51aQ==
X-Forwarded-Encrypted: i=1; AL+hErGMCK/d5BpdypWs0Ew+orkarBoqsEBGl7tR36K/gcM1kmYz1QjGCtH38/KPTFpmy2TLjdkTIxdunJ7V@vger.kernel.org
X-Gm-Message-State: APuU4Z9f8UW/Z3p3nvjywbLcHl/ld4sJ8p8Vxv/M4z9m9gQzQpaq3qSW
	eEw9rv0uTG3hy4Y/npei5xNf/CWSXYORqkbItCHzudFEpWNdWQhWj69GyeAO3euUX+MWRTwSQJb
	OMeZyfK/pDcbyTBphkX8jYL9YfwUIljk=
X-Gm-Gg: AYBFou3j8YqIZDxhhZlnvZxq/d93rb5g57DT0Ahz+VCHs8cVNeFioT8qitCN1eQukwc
	06wmB8rqkrlnBbskOWAFxFLiZKePFhoWqZUTW/6vWPtbBm9iKEMvfoa4EhCx/27rKc3mnPuFYW3
	t0I5hMRfkMxbJN7u0XqUesWWwD62VSq2rffg1JlfM+Dlt69WreqGT+9LAgOkO8N45cVQX++NuYc
	ampzmO2jcuX5M03INsn4/uptK49MXsCQH7dCAObTjLyIk1zhxEQ+rXo/V+VctLXOKhU8J4GQqeD
	tdKkJRat3tb5Dtx8T9JQlZIIKOaB/L4Kv7w13z5Pz+ThFEUefS/H89Y1v14D0sG/L+K7Y+Njy6E
	+dea8ZLqF+r43hKKQw9QEN14Te3LG3CDv0Hdq8WPb3jZfsBr3+0Aqez0WeyMXflj627RVHn3jgI
	23LGjM5qK3nOVg1MWQttKsmK3ilXX4sVMTfCIg/ZHB56CMSbElmbZvEJ0aEpdkztQeIryGwANwU
	VD4AQxxh0wJDJlFH2K6AeIgEr9lDIXnoyH+YXnWTuvEQVVOzA==
X-Received: by 2002:a05:6402:1ed3:b0:6b5:6116:e333 with SMTP id
 4fb4d7f45d1cf-6b756ae9459mr1091731a12.31.1794278144068; Mon, 09 Nov 2026
 18:35:44 -0800 (PST)
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110013646.1582970-1-rosenp@gmail.com> <avKAhjtbi85dpGoV@x1g10>
In-Reply-To: <avKAhjtbi85dpGoV@x1g10>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 9 Nov 2026 18:35:32 -0800
X-Gm-Features: AclHuK_Jcl2NU-HrOo7MbkFV6enMWs315CdjsGGJBAubQkYibDnJglGFx-rUHxk
Message-ID: <CAKxU2N9Rdw1vWtfxEzaiFgyzWZufWxKNQvWmW=QeCtGFa=813w@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] clk: add a driver for the ath79 PLL controller
To: Brian Masney <masneyb@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Alban Bedel <albeu@free.fr>, Antony Pavlov <antonynpavlov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 6:25=E2=80=AFPM Brian Masney <masneyb@kernel.org> wr=
ote:
>
> Hi Rosen,
>
> On Mon, Nov 09, 2026 at 05:36:40PM -0800, Rosen Penev wrote:
> > The clocks of the Atheros/Qualcomm ath79 MIPS SoCs are set up by
> > arch/mips/ath79/clock.c, a CLK_OF_DECLARE driver that registers every
> > clock before the driver core is up. This series replaces it with a new
> > driver in drivers/clk.
> >
> > Only the reference and CPU clocks are registered early, with
> > CLK_OF_DECLARE_DRIVER(), because the MIPS timer needs the CPU rate from
> > plat_time_init(). A platform driver bound to the same node registers th=
e
> > DDR, AHB, MDIO, UART1 and PCIe clocks. Until it does, the early provide=
r
> > returns -EPROBE_DEFER for them. clk-mt7621 uses the same scheme.
> >
> > Patches 1 and 2 move the two remaining non-clock duties out of the arch
> > clock code, so that it only uses its own registers and the clk API: the
> > QCA956x timer interrupt workaround, and the reference clock that is
> > read from the bootstrap pins when the device tree has no rate. Patches =
3
> > and 4 add the UART1 and PCIe PLL clock IDs. Patch 5 adds the new driver=
,
> > and patch 6 removes the old code.
> >
> > Tested on a TP-Link Archer C7 v2 (QCA9558) with an LLVM build. The CPU,
> > DDR, AHB and reference rates (960, 800, 266.67 and 40 MHz) match those
> > of the old code. The serial console, both GMACs, the PCIe PLL with a
> > QCA9880 behind it, and the WMAC all work, and no devices are left
> > deferred. The other SoCs are not tested on hardware. For each SoC the
> > rate calculation was compiled in userspace together with the old code
> > and fed 2 million random register sets. The results are identical,
> > except where the old code overflowed 32 bits with register values that
> > no real setup uses.
> >
> > Changes in v2:
> > - Post the new driver as one patch, instead of moving
> >   arch/mips/ath79/clock.c to drivers/clk and cleaning it up over six
> >   patches (review feedback).
> > - Register only the reference and CPU clocks with CLK_OF_DECLARE, and
> >   the others from a platform driver (review feedback).
> > - Describe the SoCs with match data, and read the CPU, DDR and AHB
> >   selection of AR934x and later with one function.
> > - Keep mapping the AR934x SRIF block from its fixed address. It lies
> >   inside the wireless MAC registers, which ath9k claims, so it can't be
> >   a reg entry of the PLL node.
> > - Drop the clkdev registrations, which have no users.
> >
> > Claude Code (Claude Opus 5.5) was used while preparing this series. It
> > wrote most of the new driver from the old one, together with the
> > userspace test of the rate calculation. I reviewed and tested every
> > change and take responsibility for it.
>
> 40 minutes elapsed from when I asked for changes to when a fully formed
> new driver was posted with major changes. Your cover letter says this
> v2 was tested on real hardware, however I am honestly a bit skeptical
> given the short time frame. On top of that, that's not enough time to
> also go through what all Claude did for you. Please slow down!!
This was tested with a linux-next kernel on an Archer C7 v2 hooked up
through serial and two ethernet cables (LAN and WAN). There's no
difference that I can see between the old and new driver.

That being said, I only have two pieces of hardware on which testing
can be done. Both are rather new relatively speaking. Older version of
this series is currently live on OpenWrt with seemingly no ill
consequences.
>
> I'm going to pass on reviewing this version. I want you to take some
> time to test this on real hardware, and understand the code. If after
> that you truly have no additional changes, then I'll reconsider
> reviewing this version.
Sashiko had two complaints. I'll fix those in v3.
>
> Also, if you want to help, then consider helping with reviews on patches
> from other people, in particular with the large series for the new SoC
> vendors. It's a lot of work reviewing the flood of patches from
> everyone. You can see the backlog for the clk core on the kernel.org
> patchwork server.
I agree. It's quite unfortunate and have no solution to it.
>
> Brian
