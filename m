Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9CFD51E43C;
	Fri, 18 Sep 2026 20:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789764162; cv=none; b=YtoTPmF+odrufPG9Wdx6+TeyQ57J9ZXsnD0dQFkUOt/xDxD86M8cCaoGgtUeK0Fa3plZ61tDcC99B2x+akcbp2NoU6xRuomcGQeopbqEAv4Vc15IVT8qpyqpPFSBf120JlZiw7zXK7xHC/rfNJ/KnlLu5p7qFzkKj8AvcIBtIRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789764162; c=relaxed/simple;
	bh=bSVVezXxJoot0tK307jcc/clK24M8xkip/hP0s4+b+8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SQQjmal4c9dJmEKgxNx43P1slh8EZA+hlmeldMXtUafvAP/KxTIkJVEMqS8EYSJ6LCZ+QczpD4b0asQFfQw6ogjeGyCyLmyaO0eM1RbBwLNAnTov0aRuy8IInH/dkQNcL14uIimewdowZ23hXpXOy1OfyWzLzWWTQlVS+0dBFsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 9D5E692009C; Fri, 18 Sep 2026 22:42:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 96EFF92009B;
	Fri, 18 Sep 2026 21:42:37 +0100 (BST)
Date: Fri, 18 Sep 2026 21:42:37 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: WangYuli <wangyuli@uniontech.com>
cc: guanwentao@uniontech.com, linux-kernel@vger.kernel.org, 
    linux-mips@vger.kernel.org, niecheng1@uniontech.com, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, zhanjun@uniontech.com
Subject: Re: [PATCH v2 2/6] MIPS: Eliminate Redundant KBUILD_SYM32 Checks
In-Reply-To: <5D20D311FB1FCDF1+20250422102253.137944-2-wangyuli@uniontech.com>
Message-ID: <alpine.DEB.2.21.2609182139430.57799@angie.orcam.me.uk>
References: <24EC7D2CA58B25F5+20250422101855.136675-1-wangyuli@uniontech.com> <5D20D311FB1FCDF1+20250422102253.137944-2-wangyuli@uniontech.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Apr 2025, WangYuli wrote:

> Given that KBUILD_SYM32=y is a prerequisite for this statement to be
> executed, it's logically redundant to verify KBUILD_SYM32 is y again.

 Indeed.

Reviewed-by: Maciej W. Rozycki <macro@orcam.me.uk>

  Maciej
