Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDCED3BA224;
	Mon, 30 Mar 2026 10:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865388; cv=none; b=i16IYrfYzPi2Xa4GOetUJ7gfiy3YMD4QCLXRZyrauObZbrTFa/4FFZHplpOspNeCVtOopyIxgY+bngpHhY7QJU8mUZ6Mb8gWO2IkAJs9xPg62g2cq+zKUxbEK+o1lC8Q/g4rcbKw8xLQsJocS5BcvEqvmkmyapm+izRoYzGTKZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865388; c=relaxed/simple;
	bh=vUxlJ2E+9k8jAlqjq+3sCL/gA5WXXEGzV3HjOY1lUSU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bbfvxOljDGcaQOjW6iGgQ+pxqi4FXOUAHnJBRVkOO0Az9ZUPt8MKreI8usfT2Qi/iJvXszCfqJn1ln+ll2sA5mNIJDuGOAM+ZqdP17G1mzW9Ooy5J6vVYfaAJRCeOX1X21gwm7ZFk/V6led53qLxbzIXmLvyTPfdpCdl9E2nhSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 6EE5892009C; Mon, 30 Mar 2026 12:09:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 67E8592009B;
	Mon, 30 Mar 2026 11:09:43 +0100 (BST)
Date: Mon, 30 Mar 2026 11:09:43 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: David Laight <david.laight.linux@gmail.com>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Fix the GCC version check for `__multi3'
 workaround
In-Reply-To: <20260330104644.1da584e1@pumpkin>
Message-ID: <alpine.DEB.2.21.2603301108170.60268@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2603300218310.60268@angie.orcam.me.uk> <20260330104644.1da584e1@pumpkin>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Mar 2026, David Laight wrote:

> Although it might be worth just deleting the version check.
> __multi3 is unconditionally defined for sparc64 and that is a much
> more complex function rather than the pretty trivial mips64 version.

 We want to catch invalid usage or we could just link with libgcc.a.

  Maciej
