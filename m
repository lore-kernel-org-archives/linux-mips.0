Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794343661;
	b=NudJp/jW+cbJObkHjT40CpONiut1G26t6S9auagwhQI0yP5K6bdi4qzLs78D/0s2Bq4E
	 MRM6t6X9akwNEN8zeSDA2Wkw54i6JIL3tPHI0B/BB9OKHmHjReA/3cWoIMouc/85IQSiE
	 A94alRJuY585FQBvwPxYfpu0Z6wl2PEBhOZ6TbYeD2tPiELwII1y9CXdorQH+nkp9zvxR
	 zT4CT26DT34XrUXgn2ZcqFU+2ccDFZJkWs/RUibTFpLTz7/Hj2vIERTiOIG6wstFFDjUS
	 XC+melADI/CFA/ZiGb9B+iTUNnTIg2ef/Ywn767EiABAKtpwtd1lF6CFmQaVQvLK2dw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794343661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rM4WUnEDUpB6Cn9A0ZHS0bV/tF1w47YrSrUOK/zgQAA=;
	b=iizYeuXIKjubXX798WLyx4QpwbNXUCuRmyXPCloAaVq/IxmqhNO6P57bJNb3XDEEF87C
	 hRqJGwTqKLLP7MffMT4aWcUKTDMP7BfdrBWPPwAm70eSZE0uxCn6cM0y52ImUgKdg2BJ9
	 atUjsYApC8d8ZxEqpkem88O4jVBFybZLvGa1EXA3xkrtIa4iTV1uqL6RYt4d1RSXJ4O65
	 zOFC0oUEKoZeiUA3upGwjh9QpxHWPrJ7FaqLkVpvpzcjNaUjTpSaFR2d3pyPEm2GPgtmJ
	 JUylNFKkeVzEsjmDb2uXGcpG/G/jWeBsEwpB68h3v1bTNp7yD3pYDSJPW1++AJbFu/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kyTgKKe+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6B6606A332
	for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 20:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C6B6606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kyTgKKe+
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso356577866b.3
        for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2026 12:47:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794343659; cv=none;
        d=google.com; s=arc-20260327;
        b=SFE6zjyVt2qpn8RdHsQf4eaGIXvn02C4j9jUGVSsGn8b36KIeTId5K06QzaWSoQL1p
         M5GQZ3ieWxd2K55nGTP+l41V8JfpRaGfnxabpK3S/bt/LOGit2BrnXwKeBgVB3jrPaaG
         7ZEP0KG2Ru+pUyKFaaOZZ2F8NN1GCmvBWlvw1tnDKNApz8ri4/CmMEQipgrt+YYlJcUg
         XNtv3d8qqb5lP1jwjjSKKV0S7FoQySAloie2Le1u+RtlUGUDo20i3JOy2jQMxsH+wxhS
         0YdA84MpofpSGU+cVhmDHiSp2M6BoeGlXp2jUKr/3cnOEScCv7tGKs8NWEM2IalXFt/L
         P9vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rM4WUnEDUpB6Cn9A0ZHS0bV/tF1w47YrSrUOK/zgQAA=;
        fh=ZcxEYf7vmTe17+n+8Wp/Ptkze2wy2frM817kEfH1cdw=;
        b=Mw4P6o1kJrVqU4h+ts1/0Mlole32TeFzqHz+8OWmwiDrw4sNyxUq1ZqszfEqTsrRNR
         vnuQBvrkTXMy4o2JQU9SurTY5GClyNvGqOeLTZObRNWkDzygzDE9rifyt8R1XpA7wUh/
         G5Q33bj2Fga4HSYdsP9cu2VBzyLpnX+jpJC1bUVhNb+7cB3Eu9urj80VhlcC3ecIq9A6
         hjJL4dEOYJYmcXbtb+8l6bp+VPzYgq0ADWanm+tJfOFHHM8Htk/y9vouKy1VciqBqU9m
         RsGlu5ycPtDYXmtq9l2hOyI8C0ENRx6okD4sS3+GB9ur/yHlupLlFS7I+2FWzmmykDBU
         pM/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794343659; x=1794948459; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rM4WUnEDUpB6Cn9A0ZHS0bV/tF1w47YrSrUOK/zgQAA=;
        b=kyTgKKe+EjpbrhUk5Et4nVWbjvTgPhhAiWlXDPWD5e2simWlTxywGmwH5T1bIxsNSK
         YButoRRKyFjPlChndRNNeyubyhrugPo6xA5G/wXVpMYWd6TQKcL0/4ewmjAPXM/snxLx
         TFwe8K53CMZVeugFg5+u8f/2rGawWSw/ov3X+c6jRgwc/zuuD0W/9gy42uhoLJEvl5Qu
         rIbpo8pHk2s/4c2y0PiuUQQtToYykA7573bsFPi25bQAvn84fu7CnT75Laeb/wKII01c
         47jcrtGpGsJU5RlurWSC87FmanH3NtEptf00DrR3tzx/fiH3QWNOCv3mX+c7eC4+vdS5
         hGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794343659; x=1794948459;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rM4WUnEDUpB6Cn9A0ZHS0bV/tF1w47YrSrUOK/zgQAA=;
        b=bnuyswyOTzg0o60U1kQwwSql5PoOl62JHfHnP3gArcrfdPS1H51DIrUxTa/ZErLacU
         MHeSrME2RKsqVCFT20BgeJHSz5JRc7nO7Y9vGwrykCulms9cFl+6pfCwds+iNUOJTp4r
         H/YKIYVCwMkb9+PRrhRqM/IOIFEUfnVv2iXGCvXViebO/bVtducur06fcJBmJFdoDRIK
         8vytJuHZm/ryp98JhogUJHOV3NU5CRJoeHP3Gjy3OXnmlrjvoW65ddNIUOgsS/TuKbUr
         WjyQsfeixG1KbwGw0U8IMW4u2ND09qPo42rNS6ow7zPnqDiclbjlsWMHwPuG/JsTF1NT
         H50w==
X-Forwarded-Encrypted: i=1; AL+hErHcL3zDTQSr/wJ6n7XeDBImAJ5kj3YKLD8IatnUT5YGQn3xGWshx6brRKoUdWR+/8cYMvOOEUFIpuhy@vger.kernel.org
X-Gm-Message-State: APuU4Z91YHaNikeCNdepYwDIAT8sKi4veWP0JqP9qhpdbjuYI+ZP+F8g
	Y9HMiYmRVKh8h6n01X3tFsAZMDZ0fm2v6JGGCcD3JPIJJ/Z4jypUgUdi3lB3x5Ydzdn7RLf+Jmp
	ImGEREaKy9SXjaLM0EPLZD0jmIUlg/Ic=
X-Gm-Gg: AYBFou2U65toJG4xalKLSzvA1s2EtKge7jabM8BbSn9zopSUyc60b/6pbcNl8rHnvRN
	y18Qm01R39vD4Z5hSn05VBt0uV+vik27/R8ll5pB2CaZWzfwjxEb+8fZqxB3vLuI7qRvci0+FaZ
	iqrpIHoSXpUP9INK6kqkK2dgf4ghghB8oUgvdk2AkFzXhGoz2CtqmNGRWut3/QUFbbWzLwgBstr
	Sv72ZlUlaJ9JHGyE7/8iw+zYetmd474JZsT/fu0zEsChSlapefl7jwNPG9Qd1xfOoiWOZ9QPbtP
	Hy26bYJanFq28yEKh0LXilQYKiKb6o04ZrHZofMQqopA8A6zvHsz2k713FMp95p+pndEqWGIJbl
	v1uWCyu7CJoS+p3lIdqiUr/eUhb73yBwKUw+LY2Rv/LARQwEzRCI0ABYma9OZPbvmzh2s+Z/ApH
	IyqdpT4OkytG8dMz/gGCmgxfkQ0Vo4JaMB2zT48//P6mh51m7K3jbl8FwZQZAEczh1Ig7mMS42/
	4+ZadcLW5Ve9nh6u03KU4Oc82ssNuuqHncLLspHR40qAgp5DQ==
X-Received: by 2002:a17:907:9629:b0:c4c:ddd1:d006 with SMTP id
 a640c23a62f3a-c5066ca17a0mr19662266b.38.1794343659272; Tue, 10 Nov 2026
 12:47:39 -0800 (PST)
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
 <CAKxU2N9Rdw1vWtfxEzaiFgyzWZufWxKNQvWmW=QeCtGFa=813w@mail.gmail.com> <avKHVDJJkhGgyBsI@x1g10>
In-Reply-To: <avKHVDJJkhGgyBsI@x1g10>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 10 Nov 2026 12:47:26 -0800
X-Gm-Features: AclHuK9U37xyg1UGTBVZdBBrLCrGhl3O6c9YzBYNAJfL0Ndc_wBpWSkIc42JL4I
Message-ID: <CAKxU2N-ZxfMs-6gTiaYthNt5aun0wt0qH9HJy_xaUdkhHYQ5Ng@mail.gmail.com>
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

On Mon, Nov 9, 2026 at 6:54=E2=80=AFPM Brian Masney <masneyb@kernel.org> wr=
ote:
>
> Hi Rosen,
>
> On Mon, Nov 09, 2026 at 06:35:32PM -0800, Rosen Penev wrote:
> > On Mon, Nov 9, 2026 at 6:25=E2=80=AFPM Brian Masney <masneyb@kernel.org=
> wrote:
> > > On Mon, Nov 09, 2026 at 05:36:40PM -0800, Rosen Penev wrote:
> > > > The clocks of the Atheros/Qualcomm ath79 MIPS SoCs are set up by
> > > > arch/mips/ath79/clock.c, a CLK_OF_DECLARE driver that registers eve=
ry
> > > > clock before the driver core is up. This series replaces it with a =
new
> > > > driver in drivers/clk.
> > > >
> > > > Only the reference and CPU clocks are registered early, with
> > > > CLK_OF_DECLARE_DRIVER(), because the MIPS timer needs the CPU rate =
from
> > > > plat_time_init(). A platform driver bound to the same node register=
s the
> > > > DDR, AHB, MDIO, UART1 and PCIe clocks. Until it does, the early pro=
vider
> > > > returns -EPROBE_DEFER for them. clk-mt7621 uses the same scheme.
> > > >
> > > > Patches 1 and 2 move the two remaining non-clock duties out of the =
arch
> > > > clock code, so that it only uses its own registers and the clk API:=
 the
> > > > QCA956x timer interrupt workaround, and the reference clock that is
> > > > read from the bootstrap pins when the device tree has no rate. Patc=
hes 3
> > > > and 4 add the UART1 and PCIe PLL clock IDs. Patch 5 adds the new dr=
iver,
> > > > and patch 6 removes the old code.
> > > >
> > > > Tested on a TP-Link Archer C7 v2 (QCA9558) with an LLVM build. The =
CPU,
> > > > DDR, AHB and reference rates (960, 800, 266.67 and 40 MHz) match th=
ose
> > > > of the old code. The serial console, both GMACs, the PCIe PLL with =
a
> > > > QCA9880 behind it, and the WMAC all work, and no devices are left
> > > > deferred. The other SoCs are not tested on hardware. For each SoC t=
he
> > > > rate calculation was compiled in userspace together with the old co=
de
> > > > and fed 2 million random register sets. The results are identical,
> > > > except where the old code overflowed 32 bits with register values t=
hat
> > > > no real setup uses.
> > > >
> > > > Changes in v2:
> > > > - Post the new driver as one patch, instead of moving
> > > >   arch/mips/ath79/clock.c to drivers/clk and cleaning it up over si=
x
> > > >   patches (review feedback).
> > > > - Register only the reference and CPU clocks with CLK_OF_DECLARE, a=
nd
> > > >   the others from a platform driver (review feedback).
> > > > - Describe the SoCs with match data, and read the CPU, DDR and AHB
> > > >   selection of AR934x and later with one function.
> > > > - Keep mapping the AR934x SRIF block from its fixed address. It lie=
s
> > > >   inside the wireless MAC registers, which ath9k claims, so it can'=
t be
> > > >   a reg entry of the PLL node.
> > > > - Drop the clkdev registrations, which have no users.
> > > >
> > > > Claude Code (Claude Opus 5.5) was used while preparing this series.=
 It
> > > > wrote most of the new driver from the old one, together with the
> > > > userspace test of the rate calculation. I reviewed and tested every
> > > > change and take responsibility for it.
> > >
> > > 40 minutes elapsed from when I asked for changes to when a fully form=
ed
> > > new driver was posted with major changes. Your cover letter says this
> > > v2 was tested on real hardware, however I am honestly a bit skeptical
> > > given the short time frame. On top of that, that's not enough time to
> > > also go through what all Claude did for you. Please slow down!!
> >
> > This was tested with a linux-next kernel on an Archer C7 v2 hooked up
> > through serial and two ethernet cables (LAN and WAN). There's no
> > difference that I can see between the old and new driver.
>
> The clk_summary debugfs entries would be a good place to compare as
> well.
>
> > That being said, I only have two pieces of hardware on which testing
> > can be done. Both are rather new relatively speaking. Older version of
> > this series is currently live on OpenWrt with seemingly no ill
> > consequences.
> > >
> > > I'm going to pass on reviewing this version. I want you to take some
> > > time to test this on real hardware, and understand the code. If after
> > > that you truly have no additional changes, then I'll reconsider
> > > reviewing this version.
> >
> > Sashiko had two complaints. I'll fix those in v3.
> > >
> > > Also, if you want to help, then consider helping with reviews on patc=
hes
> > > from other people, in particular with the large series for the new So=
C
> > > vendors. It's a lot of work reviewing the flood of patches from
> > > everyone. You can see the backlog for the clk core on the kernel.org
> > > patchwork server.
> >
> > I agree. It's quite unfortunate and have no solution to it.
>
> Just some friendly advice: If you keep churning out AI code as quick as
> you can generate it, then your stuff will end up at the very bottom of
> the review queue. There's a long backlog of other changes that need to
> be reviewed.
Sure. I'll wait a bit.
>
> I'm not saying that you need to go review patches, but that goes a
> really long way to building goodwill in the community. Maybe if you post
> a large series like this go help review 2 or 3 patch sets that's in the
> backlog from other people.
>
> But seriously, the main ask from me is to please slow down before you
> post new patches. Provide some more details about how this was tested on
> real hardware.
Sure.
>
> Brian
