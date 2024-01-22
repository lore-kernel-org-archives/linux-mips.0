Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE5F18C38
	for <linux-mips@vger.kernel.org>; Mon, 22 Jan 2024 08:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705910937; cv=none; b=exaxhDJNqBsbxnMCN5UnBVYDdmCNv6LKymOu0aDVuDqhb0nuhf1/ud1AbOAhMVy93FdAzoRT/gwANypjivAOxudHBs92//X43Ib02bTZu8sJBGNbAYE35ll2mgMCN+jtyWWKI7S9BRhC2z8qic/CYVfzepyZ1e04ffiy4nLAzgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705910937; c=relaxed/simple;
	bh=ejBHDHPHMm6tpfO/5PB/rTyrkyHOITK6GpGyn1KTvxk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k9nY3UJSu9fw87XsFhZ8BGrncngYO5J1V9NtEhAY3HaiyQfb7hvJPY8Lb8uv+6gtUzcuOd+gnyjIWyYxThZ6wqhBQouLkqJUYCQSfP6Q9wRsWYL1Aw5AMx4Jx2GGocuSEn79igqTSNtS4m3psTmp2h6qaES7GyHBSsxOTE31/Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8BxTOmVIq5lJHIDAA--.4032S3;
	Mon, 22 Jan 2024 16:08:53 +0800 (CST)
Received: from localhost.localdomain (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxEOWKIq5llCsRAA--.5616S2;
	Mon, 22 Jan 2024 16:08:51 +0800 (CST)
From: Huang Pei <huangpei@loongson.cn>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Bibo Mao <maobibo@loongson.cn>,
	linux-mips@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Burton <paulburton@kernel.org>,
	Li Xuefeng <lixuefeng@loongson.cn>,
	Yang Tiezhu <yangtiezhu@loongson.cn>,
	Gao Juxin <gaojuxin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH V6]: MIPS: loongson64: fix boot failure
Date: Mon, 22 Jan 2024 16:08:32 +0800
Message-Id: <20240122080834.8251-1-huangpei@loongson.cn>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <ZZ29Wr9yfAcqGxrN@alpha.franken.de>
References: <ZZ29Wr9yfAcqGxrN@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxEOWKIq5llCsRAA--.5616S2
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7Cj
	xVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zV
	CFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2
	z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw2
	8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI
	42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
	80aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7_MaUUUUU

Patch 1: simplify the code, thanks Thomas.

Patch 2: correct comment and commit message.


