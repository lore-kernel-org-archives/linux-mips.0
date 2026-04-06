Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3844C14A4F0;
	Mon,  6 Apr 2026 00:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775436054; cv=none; b=jg8OhohDMrrfBlRBYbPvpREKa4jCsz1wwBz3awc47Q6dWUZTlt3/2WnMnBl4y+Xca6B9iJR/tvfRfTMGC8jFWK2fES5mJ6j5bgCpaE+M4Wm02l4fBKdS6F0b0PpdLcT9GRgi0uJRaKh5zk0ILwmy+XMtO1DkZz3vZg6moot/z7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775436054; c=relaxed/simple;
	bh=YgIpNrW1Yy7/2NdK5XIiRsGXFSUcACuUc7LD8BhaXlw=;
	h=From:Date:Message-ID:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FX2s0iS/aasFkx5UysQKjuto10alJYAMKyZKAMrP0Qmf+jqwxoRuFKn+MrI8ZSWm2tun2q/vghcg+i1ixQtOBuruUQ9iloUei52bmCjNO8P6IwztT8ZaB740kQ9ZhYQ37WkpW7wtC+kl3KnFoY6peCik83WskEiPs5RPG+4f32o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from reply.eml (unknown [111.196.245.197])
	by APP-03 (Coremail) with SMTP id rQCowABngdgHAdNpBBwPDQ--.5963S2;
	Mon, 06 Apr 2026 08:40:40 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Mon, 6 Apr 2026 13:30:00 +0800
Message-ID: <20260406133000.1-mips-malta-init-reply-pengpeng@iscas.ac.cn>
To: Sergey Shtylyov <sergei.shtylyov@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
Subject: Re: [PATCH 7/8] MIPS: malta-init: bound default console command-line append
In-Reply-To: <20260405102007.7-mips-cmdline-pengpeng@iscas.ac.cn>
References: <20260405102000.0-mips-cmdline-series-pengpeng@iscas.ac.cn> <20260405102007.7-mips-cmdline-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABngdgHAdNpBBwPDQ--.5963S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYu7k0a2IF6w1UM7kC6x804xWl14x267AK
	xVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2jI8I6cxK62vIxIIY0VWUWVWUZwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l
	84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F
	4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j
	6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7V
	C0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j
	6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrw
	CF54CYxVCY1x0262kKe7AKxVWUAVWUtwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7sRAqX
	QUUUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

Hi Sergey,

Thanks, you're right.

There is no intended control-flow change here. The only intended
functional change in this hunk is replacing the unchecked

  strcat(fw_getcmdline(), console_string);

with a bounded append.

The surrounding brace movement is accidental diff noise, and it makes the
patch much harder to read than it should be. I will clean this up in the
next revision so the hunk only shows the actual append change.

Thanks,
Pengpeng


