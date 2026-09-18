Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2FD137FF6F;
	Fri, 18 Sep 2026 21:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789765366; cv=none; b=on63U4Q4tx9+vd1c/wfb9xkhhcP2lqxDQz3fSSWkX5KQbIBz7jcw4ULChChpUohHMKku27l2Jck1aP+GJwkNluq2kENtqOeYfqLNEdPYn0PkRufvKOfYsVdLlv5ZwkIkAOeA1YpkR8OCbhIvDV7tEntn8BU8LSm2ESLqIxn+X6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789765366; c=relaxed/simple;
	bh=iZHf9RqnmC9N3s7HW6WhRiZMHRjh0+ZC09GCmynIL6k=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=l//5h06Vit3KV8i8XhxoRIG6jMX/Hrz2e0HmZif3677xOsckD8YgHy/NIxMeBg0aFwH+k16EJQvU0d0iqDDAXRgnLkDMdTDqrHHZo/opT1plAbaL7+6CjomN/DXh9hqt1graCLdIBhNqBEIBJr+avfs4cF23IVWQFlR7rj5KyLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 8ED5792009C; Fri, 18 Sep 2026 23:02:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 87AAC92009B;
	Fri, 18 Sep 2026 22:02:42 +0100 (BST)
Date: Fri, 18 Sep 2026 22:02:42 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: WangYuli <wangyuli@uniontech.com>
cc: guanwentao@uniontech.com, linux-kernel@vger.kernel.org, 
    linux-mips@vger.kernel.org, niecheng1@uniontech.com, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, zhanjun@uniontech.com
Subject: Re: [PATCH v2 5/6] MIPS: decstation_64_defconfig: Update configs
 dependencies
In-Reply-To: <566F2D64350C960C+20250422102253.137944-5-wangyuli@uniontech.com>
Message-ID: <alpine.DEB.2.21.2609182201220.57799@angie.orcam.me.uk>
References: <24EC7D2CA58B25F5+20250422101855.136675-1-wangyuli@uniontech.com> <566F2D64350C960C+20250422102253.137944-5-wangyuli@uniontech.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Apr 2025, WangYuli wrote:

> Due to long-term changes in kernel build configurations,
> run 'make savedefconfig' to update the build configuration
> dependencies.

 I find this a useful routine update to make, thank you.  However more 
discrepances have made it there and the patch does not apply anymore.  
Please rerun and resubmit.

  Maciej
