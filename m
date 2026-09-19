Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B940336403B;
	Sat, 19 Sep 2026 21:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789853223; cv=none; b=LxGvm9BDPoIJtIhVSn/ZEtPJzff5gjIeaY8XLHWFTeAti4iCB1bBoUT2WjzbYk8uM52cSlck1j5DZy02GvVfxupZKEKl08OOCjPZI50/Bidy0OE3z6YlXpvQfXqw9mTPhCQqBSf/gsQdQ68gODDKsRz8uhXhJHI/sx3McHStDvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789853223; c=relaxed/simple;
	bh=/ZsJmsFJ+KR3myXp8hkZCYFViateAtdTqATIze5PDR0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bqlpL49WU0TRprcY3IyJDTLlpQgUlQW7PGxocpeEH2SsZ6ykGU2NaM0bA5n/xU7y8r6HiigQ0dYAk/jAlMFu4JraecIPvRmdkxc2kA31C4kfuDD03qYlhLFtyCrArykB7r2c71liTBWQmmmWWMQEWL7CFl/IOVAdZxJ09VDKf6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ayk/NFqO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ayk/NFqO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACB131F000FF;
	Sat, 19 Sep 2026 21:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789853221;
	bh=5sCELVcwlaUF1fN/EGk2JGvvBkVGeQCLOdrimcUCB8g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ayk/NFqOB4D1ZerSPGJ5TsoHC5Wr49KeaCKGh9OosSp5i820woj3P9xjCOIncd4GF
	 JpiagKEZDzUH9qU9jepfXWpZn9+qsARJ2BJKl0y797YcSB5m0oTDUFlHX7yISMhB4f
	 Xv1o9rUMChcpd11yrv+AjU8+NYzmmWJ1XqAEC7PPWVG9Rme8zksLzDjyakbyytvWNZ
	 kgksX/sRBubzrnfP5RYSK2czGBgQzxha2+jE09Cvb8KzMu3M8JJFxvoqoiyDL4JH+K
	 V6rbrCoPQlw2MlA6EVcDc0sAnTXJKkGPIjaJQ9MGQc86cXqES6bEZPWdCNEhw4O9lf
	 y7jITlBexX/IA==
From: Thomas Gleixner <tglx@kernel.org>
To: =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, Thomas
 Bogendoerfer
 <tsbogend@alpha.franken.de>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>, Chao-ying Fu
 <cfu@wavecomp.com>, Aleksandar Rikalo <arikalo@gmail.com>, Paul Burton
 <paulburton@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Tawfik Bayouk
 <tawfik.bayouk@mobileye.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?Q?Beno?=
 =?utf-8?Q?=C3=AEt?= Monin
 <benoit.monin@bootlin.com>
Subject: Re: [PATCH v3 0/5] MIPS: GIC clocksource/irqchip improvements and
 fixes for multi-cluster systems
In-Reply-To: <20260907-sync-gic-counters-v3-0-3d891ddabdaf@bootlin.com>
References: <20260907-sync-gic-counters-v3-0-3d891ddabdaf@bootlin.com>
Date: Sat, 19 Sep 2026 23:26:58 +0200
Message-ID: <87o6dt6ifx.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 07 2026 at 14:46, Beno=C3=AEt Monin wrote:

Can the MIPS people who care about this code spend some time on
reviewing this pile?

  https://lore.kernel.org/871pb9841j.ffs@fw13

> This series addresses multi-cluster MIPS GIC handling: it fixes a few
> cross-cluster and lock bugs, and allows the GIC timer to be used as a
> fast local clocksource on multi-cluster systems by synchronizing the
> per-cluster counters.
>
> If you are wondering how a single patch in version one turned into a
> five-patch series in version two, the answser is PROVE_LOCKING which
> found some issues that this series addresses.
>
> The first three patches are for the irq-mips-gic irqchip driver.
>
> The first patch fixes the for_each_online_cpu_gic() macro which
> was releasing an unheld per-CPU cm_core_lock on every invocation
> on multi-cluster hardware. Move both the acquire and release into
> __gic_with_next_online_cpu() so they stay balanced and the for_each
> macro accesses all VP on a multi-cluster system.
>
> The second patch fixes a recursive acquisition of gic_lock in
> gic_set_affinity() when moving interrupt SMP affinity across clusters,
> caused by a call to gic_set_type(). Split out a gic_set_type_locked()
> helper to resolve the issue.
>
> The third patch enables the interrupt when moving affinity across
> clusters. The interrupt mask is per-cluster, so after a cross-cluster
> affinity change the interrupt was left disabled in the destination
> cluster. Handle the mask explicitly on both the old and the new side.
>
> The last two patches are for the mips-gic-timer clocksource driver.
>
> The fourth patch is what changed from version 2 of the series. It
> simplifies gic_next_event() as it is guaranteed to be invoked on the
> same CPU of the event. And the flag CLOCK_EVT_FEAT_PERCPU is added to
> better document that guarantee.
>
> The last patch is the main functional change, carried over from v1. It
> synchronizes each secondary cluster's GIC counter to cluster 0's counter
> as its CPUs come online, and once every cluster is in sync, promote the
> clocksource back from the slow cross-cluster gic_hpt_read_multicluster()
> path to the fast local gic_hpt_read(), also re-enabling the GIC
> VDSO clock mode. On the dual-cluster Mobileye EyeQ6H SoC this makes
> clock_gettime(CLOCK_MONOTONIC) about four times faster on the secondary
> cluster and replaces the jiffies-based sched_clock with the high-precision
> GIC counter.
>
> This series was tested on Mobileye SoCs with different cluster
> configurations:
> * The EyeQ5 with two clusters but only one is equipped with VP
>   (VP topology {2,2,2,2},{} total 8).
> * The EyeQ6Lplus which is strictly single cluster
>   (VP topology {4,4} total 8).
> * The EyeQ6H with two identical clusters
>   (VP topology {4,4,4,4},{4,4,4,4} total 32).
>
> Although I am posting this as a single series since the patches
> are all related to the GIC, the changes to the irqchip driver and
> to the clocksource driver are independent from each other and can be
> merged in different trees. I can split the series in two if it helps
> reviewing/merging.
>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
> ---
> Changes in v3:
> - Rebased on v7.3-rc1.
> - Simplified gic_next_event() as it is strictly per-CPU instead of fixing
>   unused code.
> - Link to v2: https://patch.msgid.link/20260810-sync-gic-counters-v2-0-df=
e8b2c376b0@bootlin.com
>
> Changes in v2:
> - Four new patches described above fixing multi-cluster
>   handling in the GIC irqchip and clocksource drivers.
> - In the last patch, gic_clocksource_promote() is now deferred via a
>   workqueue instead of a CPUHP ONLINE callback, to avoid a lockdep
>   issue on clocksource_mutex.
> - Link to v1: https://patch.msgid.link/20260724-sync-gic-counters-v1-1-aa=
24fd0f30bf@bootlin.com
>
> To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> To: Thomas Gleixner <tglx@kernel.org>
> To: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
> To: Chao-ying Fu <cfu@wavecomp.com>
> To: Aleksandar Rikalo <arikalo@gmail.com>
> To: Paul Burton <paulburton@kernel.org>
> To: Daniel Lezcano <daniel.lezcano@kernel.org>
> To: Radu Rendec <radu@rendec.net>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: linux-mips@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
>
> ---
> Beno=C3=AEt Monin (5):
>       irqchip/mips-gic: Fix unbalanced cm_core_lock in for_each_online_cp=
u_gic()
>       irqchip/mips-gic: Fix recursive acquisition of gic_lock in gic_set_=
affinity()
>       irqchip/mips-gic: Enable interrupt when moving affinity across clus=
ters
>       clocksource: mips-gic-timer: Simplify gic_next_event() for per-cpu =
timer
>       clocksource: mips-gic-timer: Use local counter on synced multi-clus=
ter systems
>
>  drivers/clocksource/mips-gic-timer.c | 127 +++++++++++++++++++++++++++++=
++----
>  drivers/irqchip/irq-mips-gic.c       |  51 ++++++++------
>  2 files changed, 144 insertions(+), 34 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260717-sync-gic-counters-1cd6b40b968e
>
> Best regards,
> --=20=20
> Beno=C3=AEt Monin, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
