Received: from avon.wwwdotorg.org ([70.85.31.133]:38199 "EHLO
        avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S6839074Ab3HUSYlLM8yj (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 21 Aug 2013 20:24:41 +0200
Message-ID: <521505E2.3050308@wwwdotorg.org>
Date: Wed, 21 Aug 2013 12:24:34 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: add <dt-bindings/> symlink
References: <1377095762-18926-1-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1377095762-18926-1-git-send-email-james.hogan@imgtec.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-Path: <swarren@wwwdotorg.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Stephen Warren <swarren@nvidia.com>, Michal Marek <mmarek@suse.cz>, Shawn Guo <shawn.guo@linaro.org>, Ian Campbell <ian.campbell@citrix.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org

On 08/21/2013 08:36 AM, James Hogan wrote:
> Add symlink to include/dt-bindings from arch/mips/boot/dts/include/ to
> match the ones in ARM and Meta architectures so that preprocessed device
> tree files can include various useful constant definitions.
> 
> See commit c58299a (kbuild: create an "include chroot" for DT bindings)
> merged in v3.10-rc1 for details.
> 
> MIPS structures it's dts files a little differently to other
> architectures, having a separate dts directory for each SoC/platform,
> but most of the definitions in the dt-bindings/ directory are common so
> for now lets just have a single "include chroot" for all MIPS platforms.

Acked-by: Stephen Warren <swarren@nvidia.com>
