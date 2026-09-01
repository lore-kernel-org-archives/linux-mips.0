Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB9F3515DF;
	Tue,  1 Sep 2026 16:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280966; cv=none; b=ATOjVT5Db0N7xiCL5krzQPo5EY/iLd0JSvouPE1uN6avgpTUkCrl5YJrJnpqzEpLX3yB115yTshINuiFzmEmBFpYn//iHVT7aDzHWjgcw2ESjbDIXARC7NLI8hjm5d8BiGIgyn6aVAcOKmW+n/odu36bVDaFZBvVSRnrHTwSrTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280966; c=relaxed/simple;
	bh=swntz4L9HLtJg2UG9/ZzLdp8IdD2tc7OIr/g248cZsk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NSBCgsf8OxLchhpR/gcsYiuJrOOcF9EJ5kviaeOYS7YhfjAuoKK/2kRbnLXebNFCy6oiVwBzEwftvkEVmgD3h6KJGUPVb47Wcs8OvsrpirHQg38k/WBN691iVxRMrhpvbkMg1QhboXd6Hi47LG+ldKu9Nc6YkEppsd8X1/wXszM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FmuBqmuA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FmuBqmuA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 648741F000E9;
	Tue,  1 Sep 2026 16:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788280965;
	bh=HDVTlAMfP0f4QnIQSJ5iqy4p0uotiN5NQJ+cYYyMCXo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=FmuBqmuAq3JP8YNaI0POHKUbWdFm5FqhIlxdVtqAULAuDDzXYDcvQSv+g0LIoTCxg
	 Wa6zN7EDMXP1aE57e4R/SXKsCj3p9pyYxCccUDoF61yfWq7CmrLw4ulyRIGeiTT/gf
	 53iM1Ht/9BdbUW10VO1B5JfkVHjRs9Te8n1phTi7O3+B0LoiQLPX0L6wm5hk2XK3af
	 i34TPdZ8QjIxTkScphHc++PDIh/p3C43fWVCyRoy0kSu/CAmqKgeWAlYCWNUz6Zbhc
	 v8XJ7rYsuW6KeO4AQfl9MJ8ARa2R/lq0GIh5E1f+Eo5wsjNhASee0onrqYiX+sAFZW
	 D2MRVIXPF6gdQ==
From: Thomas Gleixner <tglx@kernel.org>
To: =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, Thomas
 Bogendoerfer
 <tsbogend@alpha.franken.de>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>, Chao-ying Fu
 <cfu@wavecomp.com>, Aleksandar Rikalo <arikalo@gmail.com>, Paul Burton
 <paulburton@kernel.org>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Tawfik Bayouk
 <tawfik.bayouk@mobileye.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] clocksource: mips-gic-timer: Set next GIC event
 on the correct VP
In-Reply-To: <-6r_yDA2RwW_Yn6kas-7SQ@bootlin.com>
References: <20260810-sync-gic-counters-v2-0-dfe8b2c376b0@bootlin.com>
 <20260810-sync-gic-counters-v2-4-dfe8b2c376b0@bootlin.com>
 <87o6exi3pi.ffs@fw13> <-6r_yDA2RwW_Yn6kas-7SQ@bootlin.com>
Date: Tue, 01 Sep 2026 18:42:41 +0200
Message-ID: <87ik4oc48u.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01 2026 at 17:53, Beno=C3=AEt Monin wrote:
> On Thursday, 20 August 2026 at 10:41:29 CEST, Thomas Gleixner wrote:
>> > On a multi-cluster system each cluster has its own GIC. The VO window =
of
>> > the local GIC is what write_gic_vl_other() redirects, so when the targ=
et
>> > CPU belongs to another cluster, write_gic_vo_compare() lands in the
>> > wrong GIC, overwriting the COMPARE register of a VP in the local clust=
er.
>>=20
>> The MIPS GIC clockevent device is strictly registered per CPU with the
>> cpumask of that CPU. See gic_clockevent_cpu_init().
>>=20
>> The set_next_event() callback of a per CPU clockevent device is _always_
>> invoked on that CPU and cannot be invoked on a different CPU.
>>=20
>> So I completely fail to understand what this cluster and non-current CPU
>> voodoo is about.
>>=20
> Going through the log, here is what I found:
>
> The commit 414408d0eedd ("MIPS: allow GIC clockevent device config
> from other CPUs") was merged in v3.16, its intent was to make the GIC
> clockevent usable as a tick broadcast device.

Ah. Nice detective work.

> Also in v3.16, the commit 0467811e9bdb ("MIPS: mark GIC clockevent device
> with CLOCK_EVT_FEAT_C3STOP") sets the C3STOP flag. With this flag, as
> I understand it, the GIC clockevent cannot be used as a tick broadcast
> device. So the set_next_event() callback is always invoked on the CPU
> of the event.

Correct. A broadcast device cannot stop. The whole point of a broadcast
decive is to act as a global backup for per CPU devices which are
affected by C3STOP. The PPC people added a hrtimer broadcast device to
handle the case where no other devices are available

> The `if/else` was added later in v4.15 by commit f16ff2bdb135
> ("clocksource/drivers/mips-gic-timer: Add fastpath for local timer
> updates"). But the `else` path was never called.

So my assumption about voodoo was not too far off :)

> I am going to drop the `else` path, should I also add the
> CLOCK_EVT_FEAT_PERCPU flag, or is C3STOP and the cpumask enough?

You can, though the device i already excluded from being qualified for
broadcast by C3STOP. But for clarity sake, yes.

Thanks,

        tglx
