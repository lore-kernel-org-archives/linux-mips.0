Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1109A53163C
	for <linux-mips@vger.kernel.org>; Thu,  1 Oct 2026 21:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790888770; cv=pass; b=eaEglb9on1tc3UDgEb4vzIL0nzrRwwMgiQ+aTDFlnqzo7TuMQDIxYyjKUKYGzJcaohx/tuCS194GddKQLAkn7hiWZd5nKNfTMFSH3zouvoIQB5CTJpDC9K2yH4eW+Sqj9UUXY5hQyfyJJWg7prRHDWwfM+STa8QdFO1P/HFbxdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790888770; c=relaxed/simple;
	bh=xN21QYy0yGgz2sHT1nXnC/21nVEwjhkQB04Hg4E+rW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gS1vU7pgRkPlQNV8/g8Hmv+5eixlw8nyt6qDEmTV5ldFfn0yYKOT05YGnCzKE9IzeUMTjuHDMo4yDTMPztYzHtdX/eIl663LxKVW2F9vw+xxtqZEyFZNjBEtMt842/uyeW3n4J9t/yZURdnlfZ0LMj4i8HHq83Za9SQnbaNucW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=CAwV36pr; arc=pass smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="CAwV36pr"
Received: by mail-pz2-f39.google.com with SMTP id d2e1a72fcca58-88098db8dcdso3301716b3a.3
        for <linux-mips@vger.kernel.org>; Thu, 01 Oct 2026 14:06:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790888767; cv=none;
        d=google.com; s=arc-20260327;
        b=fZwu5jrihXf1ADSq+8CH/UgJeS4rW9CmquCtoDwZIHxLRbyyHKWrlgss6RMZl+3FpA
         04xjymryJQK2XFbXOFNkSlshczPXRbX1Uv0nWGysbCSsswZ4gzQoTpZOgf/0g0dyimiP
         8gRnwB9duLAgwF/Sl6Ttu9M+OO6bt+4QVMNpJi0A7ltk++OJUwI51nGmTITqYqKzMbMU
         aNC6CAPOTomyK3NnrL5oW57LVs5mIuqquz4+xB9ZU8NLwRCs5QmMmsg8/hw6Wbv46i0g
         XK4t+v/2dGaoDCeFQL6fED3rn6lLEvShcSvEeSpvedboL6YvL1UfrykJSezqkQcNvCOJ
         MgCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zQjpYhlPNUCc8b2PKOBh4ENa5gh7HULkWsy4SYnLXSM=;
        fh=aoI7AgAXXoAMUSaz3rCiVI7wMiHy9+YyUEUzYmo5XnM=;
        b=i0MGLAWY/E3hHghMK1ilYma8FbhedE372t0o4IFByUXRVu6xxphtQiZ5vXG7vFJy8s
         h1hpwi63AFjvY9L6lnKlulyZPHsimxJvfzw0nzEYkn+xDIXbc5ic2LYQ8fg+CYEettd3
         Zlh6AsKRnPCIJIXjVAwSueW2AO81EhDhn1ShuqbodBufXwFUILwDvKRLUwbotyZBsa88
         7f59oQHc17OpNqx8Ar2nnN2ATCxanC1JiXtKTAoXEP5XYvsrHoe7qC8532x2myih9s5I
         hK+HqWrnRxcubiNURWXoNrf2Ie03Vm9Qso5GSeO8Qlxdcbwwq1i73++2BJ+qbiSYxFHU
         /mFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1790888767; x=1791493567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zQjpYhlPNUCc8b2PKOBh4ENa5gh7HULkWsy4SYnLXSM=;
        b=CAwV36prXHOZw2NRE+aSACbPdDsBf2SHqbBYA6oNTHRxcIGcOyC/CJqkRH7LJRevOZ
         ClcJMU2t93f7XmqqwruK0c5ZXJiXQfI/+n+w9nHyb4EcEh0EZTu11pUBC9xzrVuOqKBT
         YsV75j7RrnJU55Z+JqH44vXWfdCbI4I+NCB8980IdTgu7vzPMxHvgU+uCw/+FxPpgY0h
         63X1M3w+g/hILuWVI8qWSFmlSwv2NKZwGdJ2DwWfYsxtFTA/lG+C3YADiA4myoIGj7HP
         Z1Ev8yhuTUNqN+BrgGDh8F6GLVD0gbmqkkcnf9FOFy5sLyuxAa1XjcNkIrhbHMfk8YG5
         z0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790888767; x=1791493567;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQjpYhlPNUCc8b2PKOBh4ENa5gh7HULkWsy4SYnLXSM=;
        b=mFKWSWh7hbCpzgcMs/E596KPpex+D9XImpOqDzMn673LahCHmgis9+IZ1noNF5OW5Y
         oQl8h42DeZS66LLO1OsCfgMt6BHWovECXpzs8FQrXKGz90Ya+vy0zYwZ3Ev326/srOL2
         MJKcustxqEQXHv6BwCT8CM/erQi8TgIfYYe+jWLDO34f5RFp+9sZp8GEqLPGgnEdTLQD
         uamECYf9Ptrh6KYzbtuNIP/KmqEV270XlkZ0lUVCrMIezFnzAy5y9EzjEw9GALjdQS3k
         OudD0v2jjg01BC7MB61/Z5YfUaeJH5lR/5kplVrDoOQ4zDoaD/jKMeuq1S+Zyjd85Ohy
         2M6Q==
X-Forwarded-Encrypted: i=1; AKwUvBw5fWYu3ouuzsNBteNPry0qDTolvHdyV/wT7yNo5gM+Zt3eKbfLjM4mw2SUlpV5PvxXuBanb1TxGTgx@vger.kernel.org
X-Gm-Message-State: AFuF++lYv/GbEn2athYhZYQ3sH4AfHOhxuONjr9o/OrZBca87TAWRcBw
	LhwtA18jWbLYKf2zP2yFxOGSTBkydnpCaOiOsoFJ3e8SXb70QeWTpzlWWQShRppqqVu11oRq54m
	dFzIt6pkW4ERmGycy26qp+SUOMx5Ym1Uvyb9Y6OJC
X-Gm-Gg: AYBFou2sQfV19V3ZM00OwgNEd3HA3jaYLpaPVyJD3u1RyXfgoCrPvfrB3NGCXA68dPz
	3qAmE8ywlkTP3ria5OKBYADsDAMneHrRanDVyiYxGjUBHiogSwA8rxK2BVp45SRUskgfloo7nuW
	7Z1/dejex9FN326J65xRnHNil/qwMcW+/omfK3BWY1t/zG20LXQgkVlIuzuENKce99nxCOuRYyP
	gAWgtNxjVRgp1yKfzwr9YGvpPBvl/oDwemrmkDWmtLS3pKY4LQNpfGUc/EJp/myMJNHpb+tMjk1
	RSpVwLoUYnGesiUNq4faZwl0ZHtSnMiK/RmAOU4OSnI/KCTEnMdFOUsVDp7xogVvnUwtXqJN98K
	2piXu3OV5p/y3
X-Received: by 2002:a05:6a00:1254:b0:881:5dcb:400e with SMTP id
 d2e1a72fcca58-88af6d24f34mr727169b3a.56.1790888767004; Thu, 01 Oct 2026
 14:06:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790088067.git.rrobaina@redhat.com>
In-Reply-To: <cover.1790088067.git.rrobaina@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 1 Oct 2026 17:05:54 -0400
X-Gm-Features: AclHuK923qNeclwyxHc-N96rTW9f--kU_8IWc_3FVDcJfFTXqnWMr4asd_Mjppw
Message-ID: <CAHC9VhQ=FFYVNmQdiMsqg+5KDDrSC3SZS+H2=r_GkhfwQox8tg@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] audit: log all six syscall arguments in the
 SYSCALL record
To: Ricardo Robaina <rrobaina@redhat.com>
Cc: audit@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, bpf@vger.kernel.org, eparis@redhat.com, 
	sgrubb@redhat.com, oleg@redhat.com, richard.henderson@linaro.org, 
	mattst88@gmail.com, linmag7@gmail.com, linux@armlinux.org.uk, 
	catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org, monstr@monstr.eu, 
	tsbogend@alpha.franken.de, jonas@southpole.se, 
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, chris@zankel.net, 
	jcmvbkbc@gmail.com, tglx@kernel.org, peterz@infradead.org, luto@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 3:21=E2=80=AFPM Ricardo Robaina <rrobaina@redhat.co=
m> wrote:
>
> The SYSCALL record currently logs only four of the six syscall
> arguments (a0-a3), silently discarding the remaining two. This
> leads to the need for auxiliary records when audit-relevant
> data lands in the 5th or 6th argument of a syscall.
>
> This series extends the SYSCALL record to log all six arguments,
> by adding arguments a4 and a5 inline within the existing record.

Thanks Ricardo, this looks great!

There are a few things in some of the individual patches which I reply
to in a minute, but there are a couple of "global" things that I
wanted to mention:

* As pointed out by Sashiko, when you were converting all of the
arches, it looks like you missed alpha.  I took a quick look and it
appears that it should be a pretty straightforward conversion like
most of the others.

* We need to get ACKs from all the various arch maintainers.  Aside
from the parisc changes all of your arch specific patches are trivial
(and cleaner than the existing code IMO) so I don't expect anyone to
complain, but getting ACKs will likely take some time.  Even the
parisc patches aren't that bad, and arguably they fix a problem for
seccomp so that should make asking for ACKs easier :)

Since I expect chasing down all the various maintainers for ACKs will
take a little while, and I'd like to start getting this patchset some
basic testing, I'm going to merge it into dev-staging now.  While the
dev-staging branch doesn't feed into linux-next (this isn't likely to
land in the next merge window) it is one of the branches that gets
tested automatically and included in my kernel-secnext RPM builds.
This also means you won't need to worry about keeping this patchset
up-to-date with rebasing, as I rebase dev-staging as needed (it
intentionally isn't a stable branch).  Going forward, if there are any
minor changes to this patchset, e.g. a few line change in one of two
patches, please just send a fixup patchset based against
audit/dev-staging and I'll squash it into the relevant patch in the
series.  However, in the unlikely event that a major rewrite is
needed, just send a new patchset ... but I'll be very surprised if
that happens here :)

--=20
paul-moore.com
