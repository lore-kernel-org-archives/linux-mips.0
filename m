Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDD83F54D9;
	Thu,  7 May 2026 18:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778178226; cv=none; b=eXwX8XwaFsuWEuuqKrj7zlEojhpe+p0eEYBFhMpdpnKEcpxBl5IgX+qPjWDhRCrlxmF6HuQuLpKCMsqE4+O+VnX2eoqcRhF5ZjADRHRQwxQLnVzJ/vH2hkJZYcrHjm1KY5Xs+wyT552Av95bv8XpYKV/p66A/jAN1kBUwKmUx4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778178226; c=relaxed/simple;
	bh=SNvRg5gDTkhbZ4MVjEvDT8o9L2gLvEkyba8SgNkqMSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f8gDTP0S14t0PaxY87xeI8OP+nHMU2qLm2iWwxWi1JbEJF9PUMtpbEzIaFjZmfBaWyXXwHtTG1cyZetD0i+YGHuDUwOkpEFj2LlmntRItaPHI/uuCRIgT2iHFvkGi1wHvrcXZNXvkeaq/QQBmyDkDgjVcQy1iIE/CpUYk1cmNWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BpUo08Y4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BpUo08Y4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD19CC2BCB2;
	Thu,  7 May 2026 18:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778178225;
	bh=SNvRg5gDTkhbZ4MVjEvDT8o9L2gLvEkyba8SgNkqMSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BpUo08Y4PqA/WT5Q2wn2T/MJz2GNQWzhCiOQ9eoOGD5iWVgnC13v05fgh2JzD9w0x
	 Djq3YHXNw2BZ8oaI9uhNUcwX60bQ51r4f2vZ1tnfW+5iUnna/B3urtCEl3yXJAohXD
	 WvnTp8WLOK0ArE+euMcMG5jGlSiOODUaL2v+Ilp6AN6Mu3GgitV7CpJnru5qFfwbUi
	 K5pqyjK9Xv+wzZvAzB8Y/61pJ3VyW3A0SZWW7lJ8SFE+mS6q6UmlhN5yg3lE6cEy5y
	 HrWgrGSCrtiT5IVnLWFwGjdsHOB8BO0rqYHROvLwY/Lb3hTUm0c3lHnlwN/y0Bdkyi
	 7I5nIR4L5LKBA==
Date: Thu, 7 May 2026 13:23:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-kernel@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	tglx@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: interrupt-controller: econet: Add
 CPU interrupt mapping
Message-ID: <177817822302.2211615.7080073941717543508.robh@kernel.org>
References: <20260430164157.6026-1-cjd@cjdns.fr>
 <20260430164157.6026-2-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430164157.6026-2-cjd@cjdns.fr>


On Thu, 30 Apr 2026 16:41:56 +0000, Caleb James DeLisle wrote:
> In MIPS VEIC mode (Vectored External Interrupt Controller), the
> hardware stops directly dispatching CPU interrupts such as IPIs or CPU
> performance counters, and instead it communicates them to the external
> interrupt controller (the hardware described here) which prioritizes,
> renumbers, and integrates them with its own hardware interrupt pins.
> Interrupts from the external controller are then dispatched through a
> different method via a dispatch table. In effect, the external
> controller subsumes the CPU controller and becomes the root.
> 
> 34K Manual (MD00534) Section 6.3.1.3 rev 1.13 page 136
> 
> Since there are interrupts which ought to be controlled by the CPU
> controller driver - particularly the IPI interrupts - we create a
> reverse mapping where those interrupts may be sent back to the CPU
> intc when they are received. This maintains the fiction that there is
> still a hierarchy, and keeps the DT the same no matter whether the
> processor is in VEIC mode or not. The econet,cpu-interrupt-map is
> optional and if omitted, it's assumed that no interrupts need to be
> mapped.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  .../econet,en751221-intc.yaml                 | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

