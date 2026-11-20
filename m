Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168860;
	b=BPWvfslW2vWrzz/3myjh109Ut6NjnPSA4QkWEI6QnBRVK6OzEaXGPGjT+W52IUrPX2Vk
	 6YukEnjr8AGtEcTXL+zPtJU1gFQUe1l41YmQBR5eM5ZJiQ/HXgEGUWAqwphvNZQykTrMp
	 rMSAEZVDu3uT99TOj/zXQcJbGBEgayFpFrxzXtEnPVkMlLXb1ceYaRRMs/TtQ4ZM8SSEX
	 Y11oEm68hYKykUFxtXdoXakgVKxE/rfRHy7Z9iPPsDqFZF5YZcePJVMIU5Yus61qhsjKy
	 Gx0mgS6JovgB4KW6KhlUh5Ohe2ccyzC8IiDZoPE3O5Sh+r8IGYLE8oTYbO0Hpg7ExDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168860;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=iANM5Y9LdTKMa/15tweq1qjTR+3444ej71CB7Fgksrk=;
	b=Jn/ac3oxMrcJ0V0nUubl2r0cAJeHxGGy5LlGHPXZkRLZ8IP1jqymg6qS5z/46LfZJO8O
	 3TTOVp55gMV16OMNgYS34VgQgTCloPQcG/61e1kM2yhaFup6tR9i3iQ7szxfEGwUH78Jk
	 zmm7uBIWnhTRFGQT9uCykmtZikYGFnRvT8gNaZ56P+2YWpCLEqtOkcGv4N2oAi9wZaksd
	 vBzuO8tQmL5qIXvia22NNZ+uFXehVZrvHR4wqBXso0lTi/ElXQOMyEBZYEREy2kg++0nD
	 xKJrp2phEcq6UoIPfhIebxLD2H4e2+M2G/vXAyzccJWraewJd1OAnhD/ctJXEWOHH/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RkRn7Q4k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6F2606A32C;
	Fri, 20 Nov 2026 10:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RkRn7Q4k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6028A1F000C4;
	Fri, 20 Nov 2026 10:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795168860;
	bh=iANM5Y9LdTKMa/15tweq1qjTR+3444ej71CB7Fgksrk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RkRn7Q4knrnVsk3rATSTSFWclJhKOQYpqpV+R0hTEnEAvBep0crk3AK80uPM2Q6qy
	 Bbm4DDuuPFJqymje/G0D4npvtaBrdImx15SSnTgYU7Rl+S4W861j64cfdj4TfAUb+l
	 HGUuG6te3tXWaQFYqlcJDryU+YCaaXETTeOkFAb0rt3F1eIPlPx04/OoKlAldwfVe9
	 LNH5Yvrx+9SPzK4tSJV/p9mkjC6y1DLpRGRJ5L+rqKM64ANR59PQ99KNHG2Z9LfbBY
	 lWzJrKpcCNajjKFw8MmNy16nfxdjShkqIUZ8t4z955V+dIdQCjLbrL3dfXWJDOUPcz
	 YPFEDmaU1RyXA==
From: Vinod Koul <vkoul@kernel.org>
To: Keguang Zhang <keguang.zhang@gmail.com>, 
 Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, Frank Li <Frank.li@oss.nxp.com>, 
 linux-mips@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260917163025.7171-1-mahad.ibrahim.dev@gmail.com>
References: <20260917163025.7171-1-mahad.ibrahim.dev@gmail.com>
Subject: Re: [PATCH v3] dmaengine: loongson1-apb-dma: avoid using iterator
 variable after list_for_each_entry()
Message-Id: <179516885803.45276.9680446903666595138.b4-ty@kernel.org>
Date: Fri, 20 Nov 2026 15:30:58 +0530
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 17 Sep 2026 16:30:25 +0000, Mahad Ibrahim wrote:
> ls1x_dma_tx_status() locates the descriptor actively being processed by
> walking the LLI list and comparing the hardware reported next descriptor
> pointer against each element's next-descriptor pointer.
> 
> A list_for_each_entry macro is used in the comparison phase, which at
> the end of the loop leaves the lli pointer at the currently executing LLI.
> However this also subsequently runs for a non-match lli, in which it
> points at the head. This causes a type confusion bug which treats the
> head, which is a ls1x_dma_desc, as a ls1x_dma_lli object. Additionally it
> goes forwards and prints garbage via the dev_dbg.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: loongson1-apb-dma: avoid using iterator variable after list_for_each_entry()
      commit: 5d4f5cdad22b181559c0bc8088f3ae9572ae4362

Best regards,
-- 
~Vinod


