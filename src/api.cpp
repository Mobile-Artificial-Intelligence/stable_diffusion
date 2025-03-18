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

#include <random>
#include <string>
#include <vector>

using json = nlohmann::ordered_json;

static sd_ctx_t * ctx = nullptr;

int stable_diffusion_init(char * params) {
    json json_params = json::parse(params);

    std::string model_path = "";

    if (json_params.contains("model_path") && json_params["model_path"].is_string()) {
        model_path = json_params["model_path"].get<std::string>();
    }

    std::string clip_l_path = "";

    if (json_params.contains("clip_l_path") && json_params["clip_l_path"].is_string()) {
        clip_l_path = json_params["clip_l_path"].get<std::string>();
    }

    std::string clip_g_path = "";

    if (json_params.contains("clip_g_path") && json_params["clip_g_path"].is_string()) {
        clip_g_path = json_params["clip_g_path"].get<std::string>();
    }

    std::string t5xxl_path = "";

    if (json_params.contains("t5xxl_path") && json_params["t5xxl_path"].is_string()) {
        t5xxl_path = json_params["t5xxl_path"].get<std::string>();
    }

    std::string diffusion_model_path = "";

    if (json_params.contains("diffusion_model_path") && json_params["diffusion_model_path"].is_string()) {
        diffusion_model_path = json_params["diffusion_model_path"].get<std::string>();
    }

    std::string vae_path = "";

    if (json_params.contains("vae_path") && json_params["vae_path"].is_string()) {
        vae_path = json_params["vae_path"].get<std::string>();
    }

    std::string taesd_path = "";

    if (json_params.contains("taesd_path") && json_params["taesd_path"].is_string()) {
        taesd_path = json_params["taesd_path"].get<std::string>();
    }

    std::string control_net_path = "";

    if (json_params.contains("control_net_path") && json_params["control_net_path"].is_string()) {
        control_net_path = json_params["control_net_path"].get<std::string>();
    }

    std::string lora_model_path = "";

    if (json_params.contains("lora_model_path") && json_params["lora_model_path"].is_string()) {
        lora_model_path = json_params["lora_model_path"].get<std::string>();
    }

    std::string embeddings_path = "";

    if (json_params.contains("embeddings_path") && json_params["embeddings_path"].is_string()) {
        embeddings_path = json_params["embeddings_path"].get<std::string>();
    }

    std::string id_embeddings_path = "";

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

char ** stable_diffusion_txt2img(char * params) {
    json json_params = json::parse(params);

    std::string prompt = json_params["prompt"].get<std::string>();
    std::string output_path = json_params["output_path"].get<std::string>();

    std::string negative_prompt = "";

    if (json_params.contains("negative_prompt") && json_params["negative_prompt"].is_string()) {
        negative_prompt = json_params["negative_prompt"].get<std::string>();
    }

    int clip_skip = -1;

    if (json_params.contains("clip_skip") && json_params["clip_skip"].is_number_integer()) {
        clip_skip = json_params["clip_skip"];
    }

    float cfg_scale = 7.0;

    if (json_params.contains("cfg_scale") && json_params["cfg_scale"].is_number_float()) {
        cfg_scale = json_params["cfg_scale"];
    }

    float guidance = 3.5;

    if (json_params.contains("guidance") && json_params["guidance"].is_number_float()) {
        guidance = json_params["guidance"];
    }

    float eta = 0.0;

    if (json_params.contains("eta") && json_params["eta"].is_number_float()) {
        eta = json_params["eta"];
    }

    int width = 512;

    if (json_params.contains("width") && json_params["width"].is_number_integer()) {
        width = json_params["width"];
    }

    int height = 512;

    if (json_params.contains("height") && json_params["height"].is_number_integer()) {
        height = json_params["height"];
    }

    sample_method_t sample_method = EULER_A;

    if (json_params.contains("sample_method") && json_params["sample_method"].is_number_integer()) {
        sample_method = (enum sample_method_t) json_params["sample_method"];
    }

    int sample_steps = 20;

    if (json_params.contains("sample_steps") && json_params["sample_steps"].is_number_integer()) {
        sample_steps = json_params["sample_steps"];
    }

    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<uint64_t> dis(0, INT64_MAX);
    uint64_t seed = dis(gen);

    if (json_params.contains("seed") && json_params["seed"].is_number_integer()) {
        seed = json_params["seed"];
    }

    int n_batch = 1;

    if (json_params.contains("n_batch") && json_params["n_batch"].is_number_integer()) {
        n_batch = json_params["n_batch"];
    }

    float control_strength = 0.9;

    if (json_params.contains("control_strength") && json_params["control_strength"].is_number_float()) {
        control_strength = json_params["control_strength"];
    }

    float style_strength = 0.0;

    if (json_params.contains("style_strength") && json_params["style_strength"].is_number_float()) {
        style_strength = json_params["style_strength"];
    }

    bool normalize_input = false;

    if (json_params.contains("normalize_input") && json_params["normalize_input"].is_boolean()) {
        normalize_input = json_params["normalize_input"];
    }

    float style_ratio = 20.0;

    if (json_params.contains("style_ratio") && json_params["style_ratio"].is_number_float()) {
        style_ratio = json_params["style_ratio"];
    }

    std::vector<int> skip_layers = {7, 8, 9};

    if (json_params.contains("skip_layers") && json_params["skip_layers"].is_array()) {
        skip_layers.clear();

        for (const auto &elem : json_params["skip_layers"]) {
            skip_layers.push_back(elem.get<int>());
        }
    }

    float slg_scale = 0.0;

    if (json_params.contains("slg_scale") && json_params["slg_scale"].is_number_float()) {
        slg_scale = json_params["slg_scale"];
    }

    float skip_layer_start = 0.01;

    if (json_params.contains("skip_layer_start") && json_params["skip_layer_start"].is_number_float()) {
        skip_layer_start = json_params["skip_layer_start"];
    }

    float skip_layer_end = 0.2;

    if (json_params.contains("skip_layer_end") && json_params["skip_layer_end"].is_number_float()) {
        skip_layer_end = json_params["skip_layer_end"];
    }

    auto images = txt2img(
        ctx,
        prompt.c_str(),
        negative_prompt.c_str(),
        clip_skip,
        cfg_scale,
        guidance,
        eta,
        width,
        height,
        sample_method,
        sample_steps,
        seed,
        n_batch,
        nullptr,
        control_strength,
        style_ratio,
        normalize_input,
        nullptr,
        skip_layers.data(),
        skip_layers.size(),
        slg_scale,
        skip_layer_start,
        skip_layer_end
    );

    std::vector<std:string> image_paths;

    for (int i = 0; i < images.size(); i++) {
        std::string image_path = output_path + '/' + std::to_string(i) + ".png";

        stbi_write_png(image_path.c_str(), images[i].width, images[i].height, images[i].channel, images[i].data(), 0, prompt.c_str());

        image_paths.push_back(image_path);

        free(images[i].data());
    }

    char **ret = new char*[image_paths.size()];

    for (size_t i = 0; i < image_paths.size(); i++) {
        ret[i] = strdup(image_paths[i].c_str());
    }

    return ret;
}

void stable_diffusion_free(void) {
    free_sd_ctx(ctx);
}