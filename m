Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1745D3AF64F;
	Mon,  6 Jul 2026 17:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783359557; cv=none; b=EF0Xwp1kuCaaFWNb/q3B4z7NPjon0qkt9PuWdZ3c7ixeKSZRv67lCfZP5wd18Tbqp1mhjMEMfMboz4szJaAG5gNE7HFIUHb4q9qiUkSfe4mLUOVkRZ3q7sBZBCO33r8g2GjpDK7bt1mYWld6SSzlk6QmDHBF7iONMHDPRTmuWJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783359557; c=relaxed/simple;
	bh=H/Va+ebdSGHBBF2RGwj3JdDN32oronCCPHyUBp8idDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5ys6+/BmC4258nxgrXFUDyUnRbqjidGb1YOpRdpqHIXv7QYTL2qyLqL7+ZJr5+LaO33+2+2N3dUsoPl6Ie4qYYRL5pKCKtH0K6cAdJMKiWItwS+vsRr0HwIhLYeLIKxcujO1WJxEAuelluBx/SgCr1fL0o2zDgdn99tAwgdJpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d2725Cv2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d2725Cv2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 193131F000E9;
	Mon,  6 Jul 2026 17:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783359555;
	bh=Xy8ZAHUZN1wDyXUZpqHr7pd7Qxsxq2dcB4YVK2d78UM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d2725Cv2SbkjroOwXMCQ90Zndp1LCuuP+oxD7Hh1kJOXd4cBLnMayT8qAJelXWBI8
	 wxwtlzFw59VLpTzpvISqrJp7o8+KHZg2XbWqJtSV2ePjsrcZMQM9+7wxE1AtoN8lhP
	 oOEZaDxRF15LYlsQQ3CJIiEW6aiz2tpMHHO1reqpVuHFtdyTssr3YAJLHHuxNYl7x0
	 9CtYw7IRPgP8iZr/D26YVgqq17gzEp8bdc9vcEPf4+W1tivITxsqzgFgkIgsVj1a9a
	 EbMcEECvf7SpMo9X7E8VDwa04ifSCb2J8VD32DgfuB+EDAm3wNAzgeb+YwhbE4ooAB
	 HblcgOXbvch/g==
Date: Mon, 6 Jul 2026 18:39:03 +0100
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
Message-ID: <akvoN5vvQaW3MdmI@willie-the-truck>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
 <ajvKkLw5bL-FT5JC@willie-the-truck>
 <32d41a67-cf37-4079-8218-bed2b73bbf14@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32d41a67-cf37-4079-8218-bed2b73bbf14@huawei.com>

Hi Jinjie,

On Thu, Jun 25, 2026 at 09:34:36AM +0800, Jinjie Ruan wrote:
> On 6/24/2026 8:16 PM, Will Deacon wrote:
> > Please just give me the time I asked for. If you want to help out in the
> > meantime, there are plenty of patches that need reviewing...
> 
> It was a mistake on my part, and I sincerely apologize for wasting
> community review resources and disrupting your schedule.
> 
> I will absolutely back off now and wait for your official series. Lesson
> learned. Thanks for your patience and for calling me out on this.

So I've mostly got the old series back on its feet:

  https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=cpu-hotplug

but there are still two issues left to resolve:

  1. The printing that can happen before RCU has started. Although I've
     reduced this somewhat, there are still error paths in e.g.
     verify_local_cpu_capabilities() that print a message before dying.

  2. check_local_cpu_capabilities() can mutate the system capability
     state via update_cpu_capabilities(), so it's really dodgy running
     that prior to synchronisation.

Since you've added patches in this series that try to tackle these
problems, I'll reply on those two so we can figure out how we would like
to proceed.

Cheers,

Will
