Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808C42FC876;
	Tue,  1 Sep 2026 10:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258346; cv=none; b=D07FDvOQVu0yHpWYGRoRypkzXyU19FhrmHFt0wunAaCbk5m8qpAtNG9fWeAGAiHE/Bx/W64JFAKkO9XfGksrdAODE9hF94Y0nNWe3UOd9PxDYVaecbktPSeea3SPe1f7ncgqEpGAglhD4iKIl0+zTz1w+dBMeMIA4Ey31vMfqrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258346; c=relaxed/simple;
	bh=UDIE28nH8nZMH31X5TGo/kBgOT+/3V1ygevfVhPBTHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p+lOm21i/N/57odGB5tdV9XQaWoKveGWR/sksdZibCSOjAzNA+ruptdHQyFzZIbLhuH1lwb5udYN9gO9Nk6YePFgdOQzD+uBGURFKInDVogOTFP511NQRhM9qSlerS1uHcQ6lahiMDM2ql6e1kBn+1FEYESfKg+omkJRzByxdqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GwKJ2pb2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GwKJ2pb2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F40851F000E9;
	Tue,  1 Sep 2026 10:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788258345;
	bh=JILWnOs54Nn3C+Kuiyqfpag/plbfbFDDxTr4XHpskoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GwKJ2pb20IazCMdTzU5Hgo8RXNWu8ZZnGm6PIg9BsHyoQJnaEmS4BmR4y8WeFGnTn
	 oLLkO9ba7prZwJj7sScsLLMAEsTE0f4s5YmpfnsHiI+QbOs+0tUjXj3Mydt4nYfTfT
	 TZfuPnXRQZjOrpliQObdkKuYcCBoHsO3XDC7IoU+wuDwAyYfCDhL2a/SvQjoK6YbPs
	 HcT0SgwLq3/0xAO30SY9kS1UX5P0iel5EP9MtMXfqPnz8K62k6mxQtO8Bl288kXKqe
	 1P7ip+w7s6bicT5OnN3+buZ4N+LKT10n8BUyHYI0y34N8bQisn6din/SO6CT4as7hB
	 gvZ5OO9OE2ncg==
Date: Tue, 1 Sep 2026 11:25:33 +0100
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
Message-ID: <apaoHUrbY_1JFjfU@willie-the-truck>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
 <ajvKkLw5bL-FT5JC@willie-the-truck>
 <32d41a67-cf37-4079-8218-bed2b73bbf14@huawei.com>
 <akvoN5vvQaW3MdmI@willie-the-truck>
 <110d75e9-1580-42d3-b137-89bdad22b80a@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <110d75e9-1580-42d3-b137-89bdad22b80a@huawei.com>

On Mon, Aug 31, 2026 at 11:18:47AM +0800, Jinjie Ruan wrote:
> 在 2026/7/7 1:39, Will Deacon 写道:
> > On Thu, Jun 25, 2026 at 09:34:36AM +0800, Jinjie Ruan wrote:
> >> On 6/24/2026 8:16 PM, Will Deacon wrote:
> >>> Please just give me the time I asked for. If you want to help out in the
> >>> meantime, there are plenty of patches that need reviewing...
> >>
> >> It was a mistake on my part, and I sincerely apologize for wasting
> >> community review resources and disrupting your schedule.
> >>
> >> I will absolutely back off now and wait for your official series. Lesson
> >> learned. Thanks for your patience and for calling me out on this.
> > 
> > So I've mostly got the old series back on its feet:
> > 
> >   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=cpu-hotplug
> > 
> > but there are still two issues left to resolve:
> > 
> >   1. The printing that can happen before RCU has started. Although I've
> >      reduced this somewhat, there are still error paths in e.g.
> >      verify_local_cpu_capabilities() that print a message before dying.
> > 
> >   2. check_local_cpu_capabilities() can mutate the system capability
> >      state via update_cpu_capabilities(), so it's really dodgy running
> >      that prior to synchronisation.
> 
> Just a gentle ping on this. I replied to the two remaining issues
> earlier — any thoughts on my response? Happy to help test or rebase if
> that helps.

I've been preparing a series to post asap (I was waiting for the merge
window to close), but I'm also looking at some of the id register issues
that have been pointed out around rng, mpam and mte.

Will
