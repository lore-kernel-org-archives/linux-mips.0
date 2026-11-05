Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.175.24.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893543;
	b=amFNlXi2o+1e9xA4TA9LhFnjzGjSDs/lKXzT+E7fHDfCqRkexxQGGchh5w3sVirSIt5z
	 7wSxwVa+CD4c0YBEkEIfGOuPfQx7B+zLovDOhaao7k3/q1zFd8Ad+e75+z+NRl7HrSdjE
	 7LJbUisuR6dG1I/uqqDBrpjexoOL5FoZ6RB2Vb+UiYY2P2Q55ld64B5/LK/CnqlJXr4aU
	 YYBMXwULOyU0c9WliSD1qb7EUvjF0EXcR1Vet5vCadAkU1aiAJ6/n5k9LtQxOuMRzzNAu
	 7sTPaflMxNX3TjQrlOPW3/ZKkM650h9WpY7nqupJtuNtiB1CHT87A4JJkPGlaJaSdHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893543;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=tZ0ITfq3vtAfCiMG3pAeYL6xQK2P5z0xWeHSWOCGcFI=;
	b=4nTJkzT4C56jnBLc4Nh4aJAcY5hTWgE8qGaQ62JtB0WZJo7DbTHs4K5So+AtdyMcH66i
	 N3Ij8GK2oX3gzOB7ua5KVrZvcvem6Cz3ZTsRZqNhUjz0MV+h7bW6Rh6SxXmNM5Z0Mlg8Q
	 m6sneUpYsm6DIhy+TNH+zDXvP6vmkRwpIhabiNH998K5Xpd8Zn+wCSItA0G7n1FU3Yu+R
	 4ZVDN4+eh94awSCdvkbm/TD6TGAg84pQ8eRfr9L6VBa/lA8DZ0rKqBwysECSUpqTLohfd
	 A0ooYHQNWGaIKPmtkvmU/j+js7WwhkvzLJyoK3eUbnbzMBHX0B4lA/vo6TBYZidqkxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=alpha.franken.de;
	spf=pass smtp.mailfrom=alpha.franken.de;
	arc=none smtp.remote-ip=193.175.24.41
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DB78606A335;
	Thu,  5 Nov 2026 15:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DB78606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xOzeh-00071n-00; Thu, 05 Nov 2026 16:45:35 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id ABD22C0669; Thu,  5 Nov 2026 16:43:32 +0100 (CET)
Date: Thu, 5 Nov 2026 16:43:32 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Imre Kaloz <kaloz@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] MIPS: sgi-ip32: Fence PIO reads on CRIME 1.1
Message-ID: <auykJBSzKheGmuwv@alpha.franken.de>
References: <20261021192418.7246-1-kaloz@kernel.org>
 <20261021192418.7246-5-kaloz@kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021192418.7246-5-kaloz@kernel.org>

On Wed, Oct 21, 2026 at 09:24:18PM +0200, Imre Kaloz wrote:
> On CRIME 1.1, a MACE or PCI read within about 2us of a read of some PCI
> registers (aic7880 HCNTRL, INTSTAT, ERROR) can return that read's data.

this reads strange, can you clarify what is happening ? 

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
