Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44538448B81;
	Fri, 18 Sep 2026 20:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789764847; cv=none; b=emwn53com3vD1UjjWRgvUzTbGh8Qice1WgJ0OafQRDWkvfbXd3TqZctf1hdCDnGwa5LHhU9Xp0tgiGc3ZyeRfg7dioke//nG9ewFr66DO7tM/V41Ooc8rdfJXU4/17j/+yY9+gEgdjSOJ736Zo0haR1UYHzVngL1TINuO8601Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789764847; c=relaxed/simple;
	bh=lpEwoKL0jkqnJNwRqBICHo8Mu0Fwnp1sHi7oTNOcV/8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bwXwquKqOkoqr7O7ZueyX7izKwWKe8n88nHS51o9KizRI+Mb6GpZQFYjdGeUETy/7uWr1uvrqwsk3i/CizVkWj2M6inyRnoEJpUZhUvW62GEk6QYuKFcGDYlp5mn0eUtGr563oAmRIuPGyAi+5Jh67zj3hHAwcc1WNu8G4kGVjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 2E3B592009C; Fri, 18 Sep 2026 22:54:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 2140692009B;
	Fri, 18 Sep 2026 21:54:03 +0100 (BST)
Date: Fri, 18 Sep 2026 21:54:03 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: WangYuli <wangyuli@uniontech.com>
cc: guanwentao@uniontech.com, linux-kernel@vger.kernel.org, 
    linux-mips@vger.kernel.org, niecheng1@uniontech.com, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, zhanjun@uniontech.com
Subject: Re: [PATCH v2 4/6] MIPS: dec: Remove dec_irq_dispatch()
In-Reply-To: <093E43FBF9F4F005+20250422102253.137944-4-wangyuli@uniontech.com>
Message-ID: <alpine.DEB.2.21.2609182152230.57799@angie.orcam.me.uk>
References: <24EC7D2CA58B25F5+20250422101855.136675-1-wangyuli@uniontech.com> <093E43FBF9F4F005+20250422102253.137944-4-wangyuli@uniontech.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Apr 2025, WangYuli wrote:

> Commit 187933f23679 ("[MIPS] do_IRQ cleanup") introduced dec_irq_dispatch()
> function. But Subsequent to commit 8f99a1626535 ("MIPS: Tracing: Add
> IRQENTRY_EXIT section for MIPS"), the dec_irq_dispatch() function is
> rendered superfluous. Remove it to eradicate compilation warnings.

 Superseded with commit 35554eadc1b1 ("MIPS: DEC: Remove do_IRQ() call 
indirection").  Sorry to miss this change of yours too.

  Maciej
