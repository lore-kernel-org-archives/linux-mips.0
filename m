Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0D444606D;
	Fri, 28 Aug 2026 11:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917217; cv=none; b=OKy5FHjbyLgHjfnh0TqPdtUicdBlVtet4mQ0jeROKIXlxyi+h3yn1s0sR9lLTOgGXKgnshVctq0KUsT5HrERPpPxUQrqfHhZkqh+wytufNI5hVqe1+/bp4tYQPtuGY4Aeou4ejUO1zkEGLEK2nOPlZsiJgPd2q28iGwfGWFbmig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917217; c=relaxed/simple;
	bh=71g3aqqIcF1avrw3tcUEMFL/FKmR3Ecm0PZTd53NSWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hLgJTrRcP8yAiOl99VE7h63Vu7JtNqTw5phc9HAi9LTGsxH7H4L0nDq94adMghSaA7PVJpoj8KYTOtiZ/yIThejpjiXkP9EhOfcB73LKUyC9YPvse/Db1jqyG4zNvTal2AbCuvDz0K9FC4/HHHmlHNwMCezNX94xPbapr1sZkwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowACnfPA6cpFqpPm9Bg--.43118S8;
	Fri, 28 Aug 2026 19:34:19 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Paul Cercueil <paul@crapouillou.net>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-mips@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/20] ASoC: jz4740: Propagate codec wake-up errors
Date: Fri, 28 Aug 2026 19:34:01 +0800
Message-ID: <20260828113416.47061-7-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260828113416.47061-1-pengpeng@iscas.ac.cn>
References: <20260828113416.47061-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACnfPA6cpFqpPm9Bg--.43118S8
X-Coremail-Antispam: 1UD129KBjvJXoWxWr4DKF1fZFyUur4rKF1rJFb_yoW5GrWDpF
	s7uFWFgr1rXF1rur4rtr4kZ3WYgryfKF4fZayIy3y8uw1ayry7ur45tF98ZFZ7CFy7tFsr
	WF17Zr4UCa1rK3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
	1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
	M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
	v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q6r
	43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
	Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x
	0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWx
	JVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMI
	IF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUeLvNUUUU
	U
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The JZ4740 codec can only leave its suspend state through
jz4740_codec_wakeup().  The helper ignores failures while asserting
reset, clearing suspend/reset and replaying the dirty register cache,
then the bias callback continues with later register writes.

Return the first error from all three operations and stop the
OFF-to-STANDBY transition when wake-up restoration fails.

The issue was identified via static analysis and manually reviewed.

Fixes: 3b097d64eafa ("ASoC: Add JZ4740 codec driver")

Assisted-by: LLM
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/jz4740.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/jz4740.c b/sound/soc/codecs/jz4740.c
index d3d801d850a1..efb3f8295e98 100644
--- a/sound/soc/codecs/jz4740.c
+++ b/sound/soc/codecs/jz4740.c
@@ -217,15 +217,22 @@ static struct snd_soc_dai_driver jz4740_codec_dai = {
 	.symmetric_rate = 1,
 };
 
-static void jz4740_codec_wakeup(struct regmap *regmap)
+static int jz4740_codec_wakeup(struct regmap *regmap)
 {
-	regmap_set_bits(regmap, JZ4740_REG_CODEC_1, JZ4740_CODEC_1_RESET);
+	int ret;
+
+	ret = regmap_set_bits(regmap, JZ4740_REG_CODEC_1, JZ4740_CODEC_1_RESET);
+	if (ret)
+		return ret;
+
 	udelay(2);
 
-	regmap_clear_bits(regmap, JZ4740_REG_CODEC_1,
-			  JZ4740_CODEC_1_SUSPEND | JZ4740_CODEC_1_RESET);
+	ret = regmap_clear_bits(regmap, JZ4740_REG_CODEC_1,
+				JZ4740_CODEC_1_SUSPEND | JZ4740_CODEC_1_RESET);
+	if (ret)
+		return ret;
 
-	regcache_sync(regmap);
+	return regcache_sync(regmap);
 }
 
 static int jz4740_codec_set_bias_level(struct snd_soc_component *component,
@@ -235,6 +242,7 @@ static int jz4740_codec_set_bias_level(struct snd_soc_component *component,
 	struct jz4740_codec *jz4740_codec = snd_soc_component_get_drvdata(component);
 	struct regmap *regmap = jz4740_codec->regmap;
 	unsigned int mask;
+	int ret;
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
@@ -248,8 +256,11 @@ static int jz4740_codec_set_bias_level(struct snd_soc_component *component,
 		break;
 	case SND_SOC_BIAS_STANDBY:
 		/* The only way to clear the suspend flag is to reset the codec */
-		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF)
-			jz4740_codec_wakeup(regmap);
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
+			ret = jz4740_codec_wakeup(regmap);
+			if (ret)
+				return ret;
+		}
 
 		mask = JZ4740_CODEC_1_VREF_DISABLE |
 			JZ4740_CODEC_1_VREF_AMP_DISABLE |
-- 
2.43.0

