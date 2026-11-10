Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794354807;
	b=LuDU/URlaXV9DDjzJelfad//Lk50j5xhjd6wPx0P1TslDHL/gc56ZvQXGfABGBOVEhcg
	 dmY4vTgHEQDDjYNrW1Z4/wQ/mChzCIFMEGmzZE51mjCpW5TVGthpGu6aPS3JGlPdbJUDH
	 41Wnvg8VlPC2yXZnRVd31b2nAbi/Rh5vmeQ7g1WXl+2sV+96kdRsqjSQT6pKfBMq3lLJa
	 g5eTU2sNVfv62pZEFMmuKH8pNMEXYqAzNELA44NyVQSjdUjhPbrSSuf2F9WHAXmTY5fAv
	 yipQ2VNYhX7cz/qZ++Y3gxJDm/y7hh5leChE5b26DFD5SoqOwNoEw+Vmvf183VAHbxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354807;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=j5+zqxcLT7M2XiJ7CbvLqWBNHaVtVy+dk9fXRIEFWLU=;
	b=K4TmM2lPabbA3tfY8CSdkJAIooQN8fiAfnrvi12OnMBxRtEGbVRmig15f9H9BZakDAOM
	 es2s430zp6oZJVrywkWfzDFbUPWhpVQJT3jtO8qY4koC2UJ5C7po+lUEUAHIJ9o4y7Oxu
	 5SLyOJCdC1J2b4KZKtHAz581ZERVjLsccay3mNXBKlFmDrvlrqyyPGJFDfgipQGZ+23Zg
	 PuB95eOmBgHsLGiKVQfXQo/af1BpTYWKaTuURcOTRbBtAN7AxvysYXMMrnTxWGt4SBHl7
	 P+/B22esonOw6uVaprbtIg0lEziCa2graNGOAtTRT6KWMzMrpjwGtU6dA+nmTB6TZCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nin514Dh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A4B606A31C;
	Tue, 10 Nov 2026 23:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nin514Dh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073611F0093C;
	Tue, 10 Nov 2026 23:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794354806;
	bh=j5+zqxcLT7M2XiJ7CbvLqWBNHaVtVy+dk9fXRIEFWLU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=nin514DhHzcACsrjpvdUuzFTaKkSqPlLrq0lxTPZ9fyZWaQfO9QyFJ5JIEFv6/Vb+
	 Et1Fsb9XYA47QErDw4RbrFSWkU+V9v57cT4b+DO9wOi5X7LmlS0yy1RGLOkpWHAvOa
	 XZ7eP8cx5I5n+/TNTVT8V5bavrJ1mkKw0sLTLCidc+EACLCKZr3IyqmkzA3HMNIxVx
	 aVjMTV/J0L1YWsgPIhV84KvTZOk1FdFUmE5+EgkeDttipGJb6ztR2b/F0CtlYN+ybP
	 nrem23jtCOETjS9J2NBlERLskUJ3UOmNdoJluY5RYzvnhSIu8Qy2Z49eDbjPgdEaLr
	 MMHiUfP7yTprQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Rosen Penev <rosenp@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Alban Bedel <albeu@free.fr>
Cc: Radu Rendec <radu@rendec.net>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 2/3] irqchip/ath79-cpu: flush every write buffer of a
 shared interrupt
In-Reply-To: <20261108215738.113582-3-rosenp@gmail.com>
References: <20261108215738.113582-1-rosenp@gmail.com>
 <20261108215738.113582-3-rosenp@gmail.com>
Date: Wed, 11 Nov 2026 00:53:23 +0100
Message-ID: <87ld70tf9o.ffs@fw13>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Nov 08 2026 at 13:57, Rosen Penev wrote:
>  /*
> - * The IP2/IP3 lines are tied to a PCI/WMAC/USB device. Drivers for
> - * these devices typically allocate coherent DMA memory, however the
> - * DMA controller may still have some unsynchronized data in the FIFO.
> - * Issue a flush in the handlers to ensure that the driver sees
> - * the update.
> + * The MIPS core has 8 interrupt lines: IP0/IP1 are software interrupts,
> + * IP7 is the CP0 timer, and IP2-IP6 are wired by the SoC to its devices.
> + * The wiring is fixed in hardware. Several devices can share a line, like
> + * the WMAC and the PCIe root complex on IP2 of AR934x, and their drivers
> + * then request the interrupt with IRQF_SHARED.
>   *
> - * This array map the interrupt lines to the DDR write buffer channels.
> + * Each DMA master writes to DDR through its own write buffer in the DDR
> + * controller, and each write buffer has its own flush register. When a
> + * device raises its interrupt, its last DMA writes may still sit in its
> + * write buffer, so the handler could read stale descriptors or data.
> + *
> + * The CPU interrupt says nothing about which device on a shared line
> + * raised it. So before running the handlers of a line, flush the write
> + * buffers of every device wired to it. Each handler then sees its
> + * device's data, checks its own status, and returns IRQ_NONE if it was
> + * not the source.
> + *
> + * irq_wb_chans maps each CPU interrupt line to the mask of the write
> + * buffer channels to flush, from the qca,ddr-wb-channel-interrupts and
> + * qca,ddr-wb-channels properties.

Thanks for writing this up. That really makes reasoning about this way
more palatable.

