Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFAA3DFC74;
	Thu, 20 Aug 2026 08:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215294; cv=none; b=a2eNWbtip+ZqTeOcRt1tUrm3rSfo/NwtaqV37O4kCwiqzKcFFlC1gmZGT5HY14mYQbnPVWow+QjNVdmzs63yCFv69aSFYvcg14C1PYfj/JEN01g9HvOVl1EpBhDnxs7v7uSWZEz6163rsCt3Wpyz7oCM+DF1Ci6CHlSClW/V3Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215294; c=relaxed/simple;
	bh=i7hYoPECRlIjSqy6fNdTz9ZHMYsX1IFVrqNWFEqa6wg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pfemfHQbGTeaSje/t9xq/pEBQQSvmf2gEWEqY/7zGAP3hC1U7SAUznOYWUoFiLFV0QkVrQnY+V++KNA2v+MoRG4wJZgL/i5u9cV2NQBRpIie6QJIoIc4pkdMI5ixCoDdxExtujovHDn0GjA5VWfG06zmzVu3nqMY7IPFh1u+eM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LsNE0KHU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LsNE0KHU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB7B51F00A3D;
	Thu, 20 Aug 2026 08:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787215292;
	bh=thg4l9VqhK/E/XHp+A82cbrqhPB8yFyzKMFduG7T81g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=LsNE0KHU/vaXHbvKBmHSlwpQFemRgydnNoYBWzPthVhH4Nf6GBqkLK9tBtyszwa/Z
	 7Ez9J/GeblFOE8Mxa8uVxyW5prX/LUIKI0/7O3ZFjJcEayOa9v6T+nDwscYgOMZ4M1
	 7T5lSKJI2R1qymhyGk7TKbou5poIzHBQU87dcbQ+PTynwQryBpFlbWO+DFKEFvALvg
	 nWmUwR7/lVVwjjA6k+4wK956btsLo1oGAtsxq2x+anm26Q2g3l9UCMCC9KqOgNLnEC
	 mBLeYHfmA6/q7V2p7xD1ifR0qSt8noFjwmOf6k3tTwmjCHEcTIaewh9VKHWl3r6eXW
	 n7FAvNAlOTjeQ==
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
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?Q?Beno?=
 =?utf-8?Q?=C3=AEt?= Monin
 <benoit.monin@bootlin.com>
Subject: Re: [PATCH v2 4/5] clocksource: mips-gic-timer: Set next GIC event
 on the correct VP
In-Reply-To: <20260810-sync-gic-counters-v2-4-dfe8b2c376b0@bootlin.com>
References: <20260810-sync-gic-counters-v2-0-dfe8b2c376b0@bootlin.com>
 <20260810-sync-gic-counters-v2-4-dfe8b2c376b0@bootlin.com>
Date: Thu, 20 Aug 2026 10:41:29 +0200
Message-ID: <87o6exi3pi.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10 2026 at 16:25, Beno=C3=AEt Monin wrote:
> gic_next_event() programs the next event on the clock_event_device's targ=
et
> CPU. When that CPU is not the current one, the compare register is reached
> through the GIC VO (other/redirect) window, which is first pointed at the
> target VP with write_gic_vl_other().
>
> On a multi-cluster system each cluster has its own GIC. The VO window of
> the local GIC is what write_gic_vl_other() redirects, so when the target
> CPU belongs to another cluster, write_gic_vo_compare() lands in the
> wrong GIC, overwriting the COMPARE register of a VP in the local cluster.

The MIPS GIC clockevent device is strictly registered per CPU with the
cpumask of that CPU. See gic_clockevent_cpu_init().

The set_next_event() callback of a per CPU clockevent device is _always_
invoked on that CPU and cannot be invoked on a different CPU.

So I completely fail to understand what this cluster and non-current CPU
voodoo is about.

Thanks,

        tglx
