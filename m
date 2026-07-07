Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F41C2771E;
	Tue,  7 Jul 2026 06:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783405328; cv=none; b=MGtnSrCmYKtpDyjnmDmUBsx6LX5mKbjl6OjRBKN2mVcxgRoSdBsHvulp/c/0T/KXs+4aiBJwFH5IyTaP+CFJ7lehBVMiO4t5b9kbx3i9qXLnDa/lpaImWrxKGIImWe4V5sikIvO1NTIOAVogM+wpeV/tYhzb9O741qDgm5YvKq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783405328; c=relaxed/simple;
	bh=RvgyL+jT7ZBf3+nwcbXQoOpkUUnRchDvFvUEvmmySfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bC53xsBC+ugtRwm++Tr15RaktUEnP+34iTk71OcGxGkrAU4DFoMvgt1RsxkM38FYW2GM5fs38byGH1tPw0yKa9jnq0787Y2saI/SvuG51WzGLQwVboAv3+uGKcB6AJOZ7O4MNTRcY1zftRRLYZt/FU+OXnrGnF1nZjM6FwzG3BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KX6oQElB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KX6oQElB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E881F00A3A;
	Tue,  7 Jul 2026 06:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783405327;
	bh=yn/kZO4u9dWBVxPs71FKMvr7XU7SEACJ62k7H7NLLHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KX6oQElB50riJguELkN1/oM9JSIx8kufrjmms3fiXJNuW5KspQJmZPSt5txAZwfZ2
	 qmwzwv32TZ5VQ3oVo86MzmGlBTLY0Bult2je9cYUNm2GumxPfXXh02U5/eP8vmHATh
	 l0yk6hi+eNbFC6j4Z2RJlqcTzZ7DOp8Uj1YjkWzycPc4UWvkIAm4v5o6S6kgQnsXsC
	 E5uOMqlHsQQayQziHVuprBAfwDQOqDDMnD6V8Q0bGxtuBz+B3iFjgb7Li8Vf9AlbpN
	 RpGXmnITZ7hRagUJHFpM3AfnuqLKeiy/VdtNQMbB8VYinItP9T+2lm4M+HfkO2i1RE
	 HQyPN68VjyoBw==
Date: Tue, 7 Jul 2026 09:21:58 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pnina Feder <pnina.feder@mobileye.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Dave Young <ruirui.yang@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Alexandre Ghiti <alex@ghiti.fr>,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/4] vmcore-tasks: export per-task metadata to vmcoreinfo
Message-ID: <akybBoCAm-kJbfHL@kernel.org>
References: <20260622211430.4008899-1-pnina.feder@mobileye.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622211430.4008899-1-pnina.feder@mobileye.com>

(adding new Baoquan's email)

Hi Pnina,
On Tue, Jun 23, 2026 at 12:14:26AM +0300, Pnina Feder wrote:
> This series extends vmcoreinfo with struct offsets and sizes needed by
> the vmcore-tasks userspace tool to extract per-task state from a vmcore
> dump without requiring kernel debug symbols (DWARF/BTF).
> 
> The vmcore-tasks tool reads /proc/vmcore (or a saved vmcore file) and
> reconstructs, for each task:
>   - task name, pid, state, flags
>   - VMA list (start, end, flags, backing file)
>   - user register state (saved on the kernel stack at kernel entry)
>   - user-space backtrace with VMA/filename mapping
>   - kernel dmesg buffer
> 
> This provides a lightweight post-mortem crash analysis capability for
> production environments where full debug info (DWARF/BTF) is not
> available.
> 
> The companion userspace tool is submitted to kexec-tools:
>   https://lore.kernel.org/all/20260622205550.1087163-1-pnina.feder@mobileye.com/

Sorry for the delay, this fell between the cracks somehow.

The kernel side looks fine overall, but to merge it there should be an agreement
from the userspace side maintainers that vmcore-tasks is something they are
wishing to accept.

-- 
Sincerely yours,
Mike.
