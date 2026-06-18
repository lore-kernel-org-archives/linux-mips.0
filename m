Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777A4263F5E;
	Thu, 18 Jun 2026 15:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781798025; cv=none; b=ZLEIMhzjjYPIQtU39ktKVk7v2z8DxelN20F/5foTM/FwMh1Rz32tDr0PI/ILNkV+EV5bZJo+m6hpxSsNSI7G8nsYgeb9aCAyfgX400GcsUEJJPwHPbL4v2qX1BymOkphAnXM3P1OhkU50gaJKYzQso752DLHA1Y0pQGZajTkHE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781798025; c=relaxed/simple;
	bh=C8eM3uMUMgNK9w1m8n5fuVmzrgnhebKiUyF8XnXWiek=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HI/Ug71ktmERhru+0wgNML0bpjHG0jl5QshNw6geAOCGNK9FvAqIGnpzPx7CAua/LCCAt2gdnfcZdklzuwCPg16TAoHJKx20j/46aSRBx9cpfsnrXb3nCaCWT3AzS7oitgp7wYYxo+LfZcH1eFeeWhOnMJm3a5OlSxjPpQqfNiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFbyuhdx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFbyuhdx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5851F000E9;
	Thu, 18 Jun 2026 15:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781798024;
	bh=EwX9mxVgUx4kbF0qZ290eryMIgfNI0MdhJKVS5zuxOw=;
	h=From:To:Subject:In-Reply-To:References:Date;
	b=dFbyuhdxS8KRLeKukg6wGxWrZKR7+kw+xqNzs3yRunvw4FB7RQT+K+h6r1RUTVb4a
	 H+XMDkYxvmBiMuqK6N4j1KwALKy4zAVPDNJLrqk5VRjQmKqdBxJSdrP0h3D/m/mb/Y
	 08qVUbjX3v5xmk5PeWvmWNQ7NBaxuUDFHMnmx8qih+TsRiJYrLNTg9orqijFMNJ/zY
	 UYIpbgfnw2o6Wu/fRmaGf38lG5t4n+Y8avnbK9JaZ9rWD+u7xO68HArQRZjlEQIK/U
	 yTyHP2EioUBOSUKbMp9/bDNibaJlaph6Xa8ztrGG4/FL5Ju36LIJsfYUCim8Oa3P8+
	 UMWh6Gg9zlbNA==
From: Thomas Gleixner <tglx@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>, Michael Kelley
 <mhklinux@outlook.com>, "catalin.marinas@arm.com"
 <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, "pjw@kernel.org"
 <pjw@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "alex@ghiti.fr"
 <alex@ghiti.fr>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de"
 <bp@alien8.de>, "dave.hansen@linux.intel.com"
 <dave.hansen@linux.intel.com>, "hpa@zytor.com" <hpa@zytor.com>,
 "peterz@infradead.org" <peterz@infradead.org>, "kees@kernel.org"
 <kees@kernel.org>, "nathan@kernel.org" <nathan@kernel.org>,
 "linusw@kernel.org" <linusw@kernel.org>, "ojeda@kernel.org"
 <ojeda@kernel.org>, "david.kaplan@amd.com" <david.kaplan@amd.com>,
 "lukas.bulwahn@redhat.com" <lukas.bulwahn@redhat.com>,
 "ryan.roberts@arm.com" <ryan.roberts@arm.com>, "maz@kernel.org"
 <maz@kernel.org>, "timothy.hayes@arm.com" <timothy.hayes@arm.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>, "thuth@redhat.com"
 <thuth@redhat.com>, "oupton@kernel.org" <oupton@kernel.org>,
 "yeoreum.yun@arm.com" <yeoreum.yun@arm.com>, "miko.lenczewski@arm.com"
 <miko.lenczewski@arm.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, "james.clark@linaro.org"
 <james.clark@linaro.org>, "tabba@google.com" <tabba@google.com>,
 "mrigendra.chaubey@gmail.com" <mrigendra.chaubey@gmail.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "anshuman.khandual@arm.com"
 <anshuman.khandual@arm.com>, "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
 <linux-mips@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH RFC 3/3] arm64: Add HOTPLUG_PARALLEL support for
 secondary CPUs
In-Reply-To: <4588efb4-e757-4ca7-9197-025b67ca9ef6@huawei.com>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-4-ruanjinjie@huawei.com>
 <SN6PR02MB41575306521E6223561F476FD4182@SN6PR02MB4157.namprd02.prod.outlook.com>
 <4588efb4-e757-4ca7-9197-025b67ca9ef6@huawei.com>
Date: Thu, 18 Jun 2026 17:53:41 +0200
Message-ID: <874iizdeuy.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15 2026 at 17:57, Jinjie Ruan wrote:
> On 6/12/2026 11:45 PM, Michael Kelley wrote:
>
> - Default (no patch): Slowest HVC64 handling (126=E2=80=AF=CE=BCs), highe=
st WFx count
> (85k), and most total VM=E2=80=91exits.
>
> - cpuhp.parallel=3D1: HVC64 latency improved to 78=E2=80=AF=CE=BCs (close=
 to
> cpuhp.parallel=3D0), but IRQ exits increased dramatically (12.9k, 2.7=C3=
=97
> that of `cpuhp.parallel=3D0`), accounting for 95% of event time and
> becoming the new bottleneck.
>
> - cpuhp.parallel=3D0: Fastest HVC64 (69=E2=80=AF=CE=BCs), lowest IRQ exit=
s (4.8k), and
> lowest total samples, delivering the best overall boot performance.
>
> Therefor, `cpuhp.parallel=3D1` reduces HVC cost but suffers from a massive
> increase in IRQ exits, while `cpuhp.parallel=3D0` avoids this interrupt
> storm and therefore performs best in a KVM guest.

What's the cause for having this massive interrupt exit rate in parallel
mode? Just because parallel does not give a useful explanation.

Thanks,

        tglx
