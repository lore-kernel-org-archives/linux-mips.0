Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6751339B4BF;
	Wed, 24 Jun 2026 12:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782303391; cv=none; b=cf5/Q1s79ALh7PuDTDhzIePwGd9+sgcjRiVp8c2J7GaNSa7FQmrmJSsPl4Qp8aJ9ZLSzSty+TpO5WrAxwpIhlROing4ov4dKKFyamvS4FL64nYDcFatBkHF8bfzQL/BHD8Ln8CpbooyRKNlgUVr/4hmH9dxqq1M7rNPSXOn+BkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782303391; c=relaxed/simple;
	bh=Z/koWp+0srdGdNiXIFLKjHjgQy8KF6fpx2CacNwS0Ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dIQLXM96qroADdeFXlq3FXGL1P4fy5+qZOesmLPyZEHNGgKTto/44gmi1s127D2DA0xPgVqv6XGd2S8cFHPI/TGbGbh+P5Kz8UmZcCFdJMy+3C/NPBX0LWnw5xN2z269I2w0biXL5zYATqilXXhyGzhjPynu0pItd0XxRBBjQeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AMxrkXFl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AMxrkXFl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB2461F000E9;
	Wed, 24 Jun 2026 12:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782303388;
	bh=9z96Le6Wr6hAPTPEul1Uv+AT7vdYuxP94Kb+DjA8ebE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AMxrkXFljXFj71xEXhEKjZUDvN/1XAMtwpN651XSVLB14l2PO3nPqdgfpG6ll4Cw1
	 tee9eGxag7vSF4qpBfzOLw/BWz1LFiSHPMyZ5R4abHDBUEWu6NXt4moX/MVQI0CHqq
	 K4/qOwjyUDmZ8gt9q3G80bP9wz7GChssjWXUVxilKjJM6HqTqIsFsKIv8ijEbLwKdb
	 I6oO3E9C+wqxuAAip686M9CW0Mjd08umuSWVHD37ZZV+i3vDL8zJ1w9fORblxjRGDA
	 lyCAxELWsh89rdQbrmgkskKa1p4/C15RDq4rnUyliEuLMP8bcohIkLGtypLR4AOdNj
	 D7pZ1PIQzigiw==
Date: Wed, 24 Jun 2026 13:16:16 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, tsbogend@alpha.franken.de, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, peterz@infradead.org, kees@kernel.org,
	nathan@kernel.org, linusw@kernel.org, ojeda@kernel.org,
	david.kaplan@amd.com, lukas.bulwahn@redhat.com,
	ryan.roberts@arm.com, maz@kernel.org, timothy.hayes@arm.com,
	lpieralisi@kernel.org, thuth@redhat.com, menglong8.dong@gmail.com,
	oupton@kernel.org, yeoreum.yun@arm.com, miko.lenczewski@arm.com,
	broonie@kernel.org, kevin.brodsky@arm.com, james.clark@linaro.org,
	yangyicong@hisilicon.com, tabba@google.com, osandov@fb.com,
	arnd@arndb.de, anshuman.khandual@arm.com, david@kernel.org,
	akpm@linux-foundation.org, ljs@kernel.org, dev.jain@arm.com,
	yang@os.amperecomputing.com, chaitanyas.prakash@arm.com,
	kprateek.nayak@amd.com, chenl311@chinatelecom.cn,
	sshegde@linux.ibm.com, thorsten.blum@linux.dev,
	chang.seok.bae@intel.com, tim.c.chen@linux.intel.com,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 00/12] arm64: Add HOTPLUG_PARALLEL support for
 secondary CPUs
Message-ID: <ajvKkLw5bL-FT5JC@willie-the-truck>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624092537.2916971-1-ruanjinjie@huawei.com>

On Wed, Jun 24, 2026 at 05:25:25PM +0800, Jinjie Ruan wrote:
> Support for parallel secondary CPU bringup is already utilized by x86,
> MIPS, and RISC-V. This patch brings this capability to the arm64
> architecture.
> 
> Introduce CONFIG_HOTPLUG_PARALLEL_SMT to avoid primary SMT threads
> to boot first constraint.
> 
> And add a 'cpu' parameter to update_cpu_boot_status() to allow updating
> the boot status at a per-CPU granularity during parallel bringup.
> 
> Rework the global `secondary_data` and `__early_cpu_boot_status` accessed
> during early boot into per-CPU arrays to allow secondary CPUs to boot
> in parallel.
> 
> And reuse `__cpu_logical_map` array in the early boot code in head.S
> to resolve each secondary CPU's logical ID concurrently.
> 
> This series includes a subset of the refactoring patches proposed
> by Will Deacon, with further adjustments.

Sheesh, Jinjie, what are you doing?

I said yesterday that I would dust off the old series after the merge
window:

  https://lore.kernel.org/all/ajqYaklhIyvaNLlk@willie-the-truck/

"Please just give me a week or so to rebase my changes and send them out
 for discussion"

but instead, you've posted patches from me that are missing a bunch of
fixes that need to be folded back in:

  https://web.git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/commit/?h=cpu-hotplug&id=2d5b8df5d4e2bbc142e3b4f21cabbca96e3da79d

so now you're asking people to review incomplete patches from somebody
else.

Please just give me the time I asked for. If you want to help out in the
meantime, there are plenty of patches that need reviewing...

Will
