#include "api.h"
#include "json.hpp"
#include "stable-diffusion.h"

#define STB_IMAGE_IMPLEMENTATION
#define STB_IMAGE_STATIC
#include "stb_image.h"

#define STB_IMAGE_WRITE_IMPLEMENTATION
#define STB_IMAGE_WRITE_STATIC
#include "stb_image_write.h"

#define STB_IMAGE_RESIZE_IMPLEMENTATION
#define STB_IMAGE_RESIZE_STATIC
#include "stb_image_resize.h"

using json = nlohmann::ordered_json;

static sd_ctx_t * ctx = nullptr;

int stable_diffusion_init(char * params) {
    json json_params = json::parse(params);

    std::string model_path = '';

    if (json_params.contains("model_path") && json_params["model_path"].is_string()) {
        model_path = json_params["model_path"].get<std::string>();
    }

    std::string clip_l_path = '';

    if (json_params.contains("clip_l_path") && json_params["clip_l_path"].is_string()) {
        clip_l_path = json_params["clip_l_path"].get<std::string>();
    }

    std::string clip_g_path = '';

    if (json_params.contains("clip_g_path") && json_params["clip_g_path"].is_string()) {
        clip_g_path = json_params["clip_g_path"].get<std::string>();
    }

    std::string t5xxl_path = '';

    if (json_params.contains("t5xxl_path") && json_params["t5xxl_path"].is_string()) {
        t5xxl_path = json_params["t5xxl_path"].get<std::string>();
    }

    std::string diffusion_model_path = '';

    if (json_params.contains("diffusion_model_path") && json_params["diffusion_model_path"].is_string()) {
        diffusion_model_path = json_params["diffusion_model_path"].get<std::string>();
    }

    std::string vae_path = '';

    if (json_params.contains("vae_path") && json_params["vae_path"].is_string()) {
        vae_path = json_params["vae_path"].get<std::string>();
    }

    std::string taesd_path = '';

    if (json_params.contains("taesd_path") && json_params["taesd_path"].is_string()) {
        taesd_path = json_params["taesd_path"].get<std::string>();
    }

    std::string control_net_path = '';

    if (json_params.contains("control_net_path") && json_params["control_net_path"].is_string()) {
        control_net_path = json_params["control_net_path"].get<std::string>();
    }

    std::string lora_model_path = '';

    if (json_params.contains("lora_model_path") && json_params["lora_model_path"].is_string()) {
        lora_model_path = json_params["lora_model_path"].get<std::string>();
    }

    std::string embeddings_path = '';

    if (json_params.contains("embeddings_path") && json_params["embeddings_path"].is_string()) {
        embeddings_path = json_params["embeddings_path"].get<std::string>();
    }

    std::string id_embeddings_path = '';

    if (json_params.contains("id_embeddings_path") && json_params["id_embeddings_path"].is_string()) {
        id_embeddings_path = json_params["id_embeddings_path"].get<std::string>();
    }

    bool vae_decode_only = false;

    if (json_params.contains("vae_decode_only") && json_params["vae_decode_only"].is_boolean()) {
        vae_decode_only = json_params["vae_decode_only"];
    }

    bool vae_tiling = false;

    if (json_params.contains("vae_tiling") && json_params["vae_tiling"].is_boolean()) {
        vae_tiling = json_params["vae_tiling"];
    }

    bool free_params_immediately = false;

    if (json_params.contains("free_params_immediately") && json_params["free_params_immediately"].is_boolean()) {
        free_params_immediately = json_params["free_params_immediately"];
    }

    int n_threads = -1;

    if (json_params.contains("n_threads") && json_params["n_threads"].is_number_integer()) {
        n_threads = json_params["n_threads"];
    }

    sd_type_t wtype = SD_TYPE_COUNT;

    if (json_params.contains("wtype") && json_params["wtype"].is_number_integer()) {
        wtype = (enum sd_type_t) json_params["wtype"];
    }

    schedule_t s = DEFAULT;

    if (json_params.contains("schedule") && json_params["schedule"].is_number_integer()) {
        s = (enum schedule_t) json_params["schedule"];
    }

    bool keep_clip_on_cpu = false;

    if (json_params.contains("clip_on_cpu") && json_params["clip_on_cpu"].is_boolean()) {
        keep_clip_on_cpu = json_params["clip_on_cpu"];
    }

    bool keep_control_net_cpu = false;

    if (json_params.contains("control_net_cpu") && json_params["control_net_cpu"].is_boolean()) {
        keep_control_net_cpu = json_params["control_net_cpu"];
    }

    bool keep_vae_on_cpu = false;

    if (json_params.contains("vae_on_cpu") && json_params["vae_on_cpu"].is_boolean()) {
        keep_vae_on_cpu = json_params["vae_on_cpu"];
    }

    bool diffusion_flash_attn = false;

    if (json_params.contains("diffusion_flash_attn") && json_params["diffusion_flash_attn"].is_boolean()) {
        diffusion_flash_attn = json_params["diffusion_flash_attn"];
    }

    ctx = new_sd_ctx(
        strdup(model_path.c_str()),
        strdup(clip_l_path.c_str()),
        strdup(clip_g_path.c_str()),
        strdup(t5xxl_path.c_str()),
        strdup(diffusion_model_path.c_str()),
        strdup(vae_path.c_str()),
        strdup(taesd_path.c_str()),
        strdup(control_net_path.c_str()),
        strdup(lora_model_path.c_str()),
        strdup(embeddings_path.c_str()),
        strdup(id_embeddings_path.c_str()),
        vae_decode_only,
        vae_tiling,
        free_params_immediately,
        n_threads,
        wtype,
        STD_DEFAULT_RNG,
        s,
        keep_clip_on_cpu,
        keep_control_net_cpu,
        keep_vae_on_cpu,
        diffusion_flash_attn
    );

    return 0;
}

void stable_diffusion_free(void) {
    free_sd_ctx(ctx);
}