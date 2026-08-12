Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5436A33A014
	for <linux-mips@vger.kernel.org>; Wed, 12 Aug 2026 17:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786555967; cv=pass; b=Up7QUHgO3U0nUo0b7EhA787X5PdxmGVgUsBrkgxPvx1Snfq427RPdJu8dXuQVkDjfYKeVkoH06H0JlZFtdpBFC94KRHXG7yKlBraX9AaK8+hgTAAwbqSVb3aLTkPnFKTPuiuFw5iAAaB054sJRuU12h7sZLHVawt3SSpgegwqrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786555967; c=relaxed/simple;
	bh=gLQn9kOzHaA0SC3J+x96ZYrnb1g1R4UMmA39XLN5lWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hc0dKSTq7tEfhsUFpCRJJ7v9pd5+vYa0GuUFY6qPqQ6cidPDFaENoLQbpY3oJNqmG6m2OUqiQHEjZOQvwBy2C0Nh/q9fqZ4tcfi6/s89kTJXq36dR5ySkxEPWTMDwb3wOBQHrJt2kiNQQTwomwwKC/PhBAcAJLc8oaipurNJX9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cr9jYS1q; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cr9jYS1q"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-66b3803ef19so1271481d50.2
        for <linux-mips@vger.kernel.org>; Wed, 12 Aug 2026 10:32:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786555965; cv=none;
        d=google.com; s=arc-20260327;
        b=nJgU0alQYsTb+lUEd6OwM7pZCzaSV08Pngi6g8gXVFIXsKK3498+E5qbqXEpN1cPVQ
         dpB/Ese3cqjlX7eau1XRbwtLREAnP2wLPLyOBnNbOngc2vm6MRqskgo+2JmbEEeSQ+p8
         n4FxsYMmNKGmGQZ2Ltf2JIQOrOtkq23tD51prXTg8apJE+sNCHGxDSC9w1OMki9SRcfH
         CE3Orm7cJBCrC/oAAcF4RCeT9S+SElpjhVLN4mg4lalFETlfmHSznxIa5cL4sYEVzExG
         Bzcohl5Tm+3Q7241Qs6AXuRrQ9iTpzjZZk5YysTWEfl+mRrwojA45nJ4sgjNBJDV0NAB
         jxrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Te/xDy3vfy2iVX72JLiGajW7osj9pivWhpXnxbBoLl0=;
        fh=NztwnyAepIeGIt3moSk/Wk7sgaM5yE2LUI5JDkOlspI=;
        b=a+E4aV8NbKBdB3nx1OJnl9MTZDGEnI5nmuzamKzJDkiFqXK57jGabcCAFvmrS81icF
         tCi7g5k/aXq5cxtB5eaJFtnQfVc8cAJtrMI09CDvJvPFYwgeCgVCKTdcxtHMlWxKCaE+
         ksKrYyIOJ70j2raV3Wc0w5uTtIDXOV6eSnDMAsF8nb6ys9YF+KUITMF9eZoFJ448gteA
         /UEylKyRoElId4tstvMi/8ArUtqsPSLNsHU1fdk4EKe1E8dHKi4kPLFJmb/FdNGUAFie
         UyH4JwI8YSppIjnG6kdqijGFo/tQR3vrvX5mBkVIV9Pye7koc5Sz6dY1fITJo8dwcIYJ
         A2Pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786555965; x=1787160765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Te/xDy3vfy2iVX72JLiGajW7osj9pivWhpXnxbBoLl0=;
        b=Cr9jYS1qzfy79hOWDjHip6dIcw9y3NrTV8FnyKOSUIBCIgL12LEpv4Eqm3Ol8Tr5jC
         6Yc8ISc2Wfr3pkiw61jqRNCI+MZEaiZamKbFw2h60YBb3SdXURtyIvCZ4nPHOfUuP7bB
         a2D6TEkC91ZM8IDD2NAFbdufOiUxkksT3CWwR3p/rGK7F+QQOPn+y9nNZOS2VDwrPk75
         ///+batRU4wMG0mnmVJYP9eO1OoXAjRjUA9FOiFaXwrv3Tor4JExWE/VFQDAPNNfc6z4
         QYXYiPSa3LtmCPnXArnH0CkmciZ07SJAhl9ln77Dx0DlPWf0Lnk9egcthxoBt5kWOFfD
         9j3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786555965; x=1787160765;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Te/xDy3vfy2iVX72JLiGajW7osj9pivWhpXnxbBoLl0=;
        b=DFzlCmtPtcyiMFa+SQi6nzl4tEpgTLIPgHriMRhJwonr37X8DEQ98Mn/cYN7IXv0gc
         DRoIdjBEOHoU+pH4AHmxA1Fp9zXjBhOQqiG6YVZFX2t9MeqIgwkSJ8rrGzUy+ryymEvh
         wbLUgoUOuQnItI94nGKMgKZLx02GVkonEUXERD7D0mc4RlSM4qPpOrFLUeCm1ITnj9zL
         B1NVEoWVR4Msc7+VXU5h4fSVspmSzGw5bwxuu+yjet/l5ue9Cl53h5/RPkphtx4FlKkL
         h4jbDdTqEEpRh3Uw0ZsUTvmbXFfdkMmMYlHBZrAFlBK4iDCjqo95ETWM2pwZaOKcqszp
         DtxQ==
X-Forwarded-Encrypted: i=1; AHgh+RryQVcyYzHP5+CQqT8vH7RZab8iBgi+N8BDDbI/N90k7s0DSFWJtC4q5cIF5tJCsVzTkNypsQJsLzLo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+P/gh3OEgzf098O7CZib400hcBwUg3zU6MFbTvjO67jfYZpgy
	nqw4uMXU64AX/11G1SyOgMCwUbuV+ZGqSEyxwGAVyvkg50bPco00PXHhMqPiXJz4gqqLOLNEdBT
	P/YnDTXlPEFt6umqPU6fSwBRzFLL2Dpw=
X-Gm-Gg: AR+sD1175vEtzuXxF9tL7mI2U+2njCNPgo6rvVeel1Y7n/aM1z/tjNdjXa2dTIS0LG5
	GTPjhq2JKFuYrYLQNJrfoSu0RilMIfpkPmgAJBq5xlfPkdb550j19F606No6fOyU6K0Np05GRdT
	dXzqhRyQvDt2T6PX3BvfZH1pmB38SCBWvdBj3shq6NeJUnY2JA72D3EfL64Wqsw/t6/GSWkZPd9
	AZaDeQTbTDHb3yI19d6hvnj6YtnpL1pylJPY3/yJb7RUScwqHfn0kYB5TDPiOUzJ+WQs6AlT9iU
	4KduJSmop83HlqfMgYfuaOuNbPtuOAMFWpBBxE7NQn+9glN5vt3J6l5b11rms+5KDxoxlL+Zont
	d+GPX/3q/lD4y9snnq0JSj6+zgURDqSx/4H8lVda+5LU7qb7MbL9cuKCzIZIhYoX05JhLQxDbC8
	w31VgYu6/l
X-Received: by 2002:a05:690c:c4e8:b0:81d:75b4:925f with SMTP id
 00721157ae682-83108b87264mr30577897b3.19.1786555964998; Wed, 12 Aug 2026
 10:32:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812032622.1759569-1-rdunlap@infradead.org>
 <CAOiHx=mrJh0szu2B8NWideUH8RqUaM7S4OV9J4wN6p93-quW4Q@mail.gmail.com> <486033fb-a846-4b41-9814-3ccf88e6d169@infradead.org>
In-Reply-To: <486033fb-a846-4b41-9814-3ccf88e6d169@infradead.org>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Wed, 12 Aug 2026 19:32:33 +0200
X-Gm-Features: AUfX_mwfRhf-V-5WekhhTIEmJpZ2TLwgUemeNA6j9kZoBuUG9ydi_67Gb02fRe8
Message-ID: <CAOiHx=kxibbnfXCKwOfaVgNp2N87q0fY++Evh=VNKf+kJg5wPw@mail.gmail.com>
Subject: Re: [PATCH] mips: econet: fulfill unmet kconfig dependencies
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Caleb James DeLisle <cjd@cjdns.fr>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 5:19=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Hui,
>
> On 8/12/26 6:12 AM, Jonas Gorski wrote:
> > Hi,
> >
> > On Wed, Aug 12, 2026 at 5:27=E2=80=AFAM Randy Dunlap <rdunlap@infradead=
.org> wrote:
> >>
> >> ECONET selects SERIAL_8250 even though its TTY dependency is not met.
> >> ECONET selects SERIAL_OF_PLATFORM even though its TTY dependency is no=
t
> >> met.
> >> ECONET selects EARLY_PRINTK_8250 even though its EARLY_PRINTK dependen=
cy
> >> is not met.
> >>
> >> Fix these kconfig warnings by adding selects for TTY and EARLY_PRINTK.
> >>
> >> WARNING: unmet direct dependencies detected for SERIAL_8250
> >>   Depends on [n]: TTY [=3Dn] && HAS_IOMEM [=3Dy] && !S390
> >>   Selected by [y]:
> >>   - ECONET [=3Dy]
> >>
> >> WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
> >>   Depends on [n]: TTY [=3Dn] && HAS_IOMEM [=3Dy] && SERIAL_8250 [=3Dy]=
 && OF [=3Dy]
> >>   Selected by [y]:
> >>   - ECONET [=3Dy]
> >>
> >> WARNING: unmet direct dependencies detected for EARLY_PRINTK_8250
> >>   Depends on [n]: EARLY_PRINTK [=3Dn] && USE_GENERIC_EARLY_PRINTK_8250=
 [=3Dy]
> >>   Selected by [y]:
> >>   - ECONET [=3Dy]
> >>
> >> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> >> ---
> >> Cc: Caleb James DeLisle <cjd@cjdns.fr>
> >> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> >> Cc: linux-mips@vger.kernel.org
> >>
> >>  arch/mips/Kconfig |    2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> --- linux-next-20260810.orig/arch/mips/Kconfig
> >> +++ linux-next-20260810/arch/mips/Kconfig
> >> @@ -396,6 +396,7 @@ config ECONET
> >>         bool "EcoNet MIPS family"
> >>         select BOOT_RAW
> >>         select DEBUG_ZBOOT if DEBUG_KERNEL
> >> +       select EARLY_PRINTK
> >>         select EARLY_PRINTK_8250
> >
> > I think the correct solution here is to drop EARLY_PRINTK_8250 instead.
> >
>
> Gladly.
>
> > ECONET already selects SYS_HAS_EARLY_PRINTK and
> > USE_GENERIC_EARLY_PRINTK_8250. EARLY_PRINTK defaults to y if
> > SYS_HAS_EARLY_PRINTK is y (unless EXPERT is enabled), and
> > EARLY_PRINTK_8250 defaults to y if both EARLY_PRINTK and
> > USE_GENERIC_EARLY_PRINTK_8250 are y.
> >
> > That way users can actually disable EARLY_PRINTK if they wish.
> >
> >>         select ECONET_EN751221_TIMER
> >>         select SERIAL_8250
> >> @@ -407,6 +408,7 @@ config ECONET
> >>         select SYS_SUPPORTS_32BIT_KERNEL
> >>         select SYS_SUPPORTS_MIPS16
> >>         select SYS_SUPPORTS_ZBOOT_UART16550
> >> +       select TTY
> >
> > Here I don't know. ECONET seems to be the only platform (treewide)
> > that selects SERIAL_OF_PLATFORM and SERIAL_8250. Everyone else just
> > enables these via their defconfigs. No hard feelings one way or the
> > other, just noticed ECONET is the exception here.
>
> I don't prefer using "select" - it just went along with the rest of the
> Kconfig file. IOW, I would prefer using "depends on TTY".
> But you are saying that it could go into some (non-existing) defconfig fi=
le?

More like I grepped through the whole tree and ECONET was the only one
selecting these symbols, and all other occurrences where in
defconfigs.

But as you correctly pointed out, there is no defconfig for econet, so
I guess as a quick fix selecting TTY is okay, and once a defconfig
exists we can drop it.

Caleb, could you maybe add one?

Best regards,
Jonas
